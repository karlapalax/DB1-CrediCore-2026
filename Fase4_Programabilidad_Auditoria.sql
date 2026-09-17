-- ============================================================================
-- PROYECTO CREDICORE - FASE 4: PROGRAMABILIDAD Y AUDITORÍA ACTIVA
-- Estudiante: Karla Mariela Palax Tuy
-- Repositorio: DB1-CrediCore-2026
-- ============================================================================
USE CrediCoreDB;
GO

-- ============================================================================
-- PARTE A: LA CAPA DE ABSTRACCIÓN (VISTAS)
-- ============================================================================

IF OBJECT_ID('Operaciones.vw_AtencionAlCliente', 'V') IS NOT NULL
    DROP VIEW Operaciones.vw_AtencionAlCliente;
GO

CREATE VIEW Operaciones.vw_AtencionAlCliente AS
SELECT 
    C.Nombres + ' ' + C.Apellidos AS NombreCliente,
    CR.IdCredito AS NumeroCredito,
    V.Marca AS MarcaVehiculo,
    CR.Estado AS EstadoCredito,
    CR.MontoCapital AS SaldoActual
FROM Operaciones.Creditos CR
INNER JOIN Operaciones.Clientes C ON CR.IdCliente = C.IdCliente
INNER JOIN Garantias.Vehiculos V ON CR.IdVehiculo = V.IdVehiculo;
GO

-- ============================================================================
-- PARTE B: LÓGICA DE NEGOCIO SEGURA (MOTOR DE PAGOS Y TABLA HISTORIAL)
-- ============================================================================

-- 1. Crear tabla de historial de pagos si no existe
IF OBJECT_ID('Operaciones.HistorialPagos', 'U') IS NULL
BEGIN
    CREATE TABLE Operaciones.HistorialPagos (
        IdPago INT IDENTITY(1,1) PRIMARY KEY,
        IdCredito INT NOT NULL,
        MontoAbono DECIMAL(18,2) NOT NULL,
        FechaPago DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_HistorialPagos_Creditos FOREIGN KEY (IdCredito) REFERENCES Operaciones.Creditos(IdCredito)
    );
END
GO

-- 2. Procedimiento Almacenado: SP_ProcesarPago
IF OBJECT_ID('Operaciones.SP_ProcesarPago', 'P') IS NOT NULL
    DROP PROCEDURE Operaciones.SP_ProcesarPago;
GO

CREATE PROCEDURE Operaciones.SP_ProcesarPago
    @IdCredito INT,
    @MontoAbono DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Obtener saldo actual
        DECLARE @SaldoActual DECIMAL(18,2);
        
        SELECT @SaldoActual = MontoCapital 
        FROM Operaciones.Creditos 
        WHERE IdCredito = @IdCredito;

        -- Validar existencia del crédito
        IF @SaldoActual IS NULL
        BEGIN
            THROW 51000, 'El crédito especificado no existe.', 1;
        END

        -- Validar sobrepago
        IF @MontoAbono > @SaldoActual
        BEGIN
            THROW 51001, 'Error: El monto abonado supera el saldo actual del crédito.', 1;
        END

        -- Registrar pago en historial
        INSERT INTO Operaciones.HistorialPagos (IdCredito, MontoAbono)
        VALUES (@IdCredito, @MontoAbono);

        -- Actualizar saldo del crédito
        UPDATE Operaciones.Creditos
        SET MontoCapital = MontoCapital - @MontoAbono,
            Estado = CASE WHEN (MontoCapital - @MontoAbono) = 0 THEN 'Pagado' ELSE Estado END
        WHERE IdCredito = @IdCredito;

        COMMIT TRANSACTION;
        PRINT 'Pago procesado exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- ============================================================================
-- PARTE C: EL AUDITOR SILENCIOSO (TRIGGERS Y BITÁCORA)
-- ============================================================================

-- 1. Crear Esquema Auditoria
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Auditoria')
    EXEC('CREATE SCHEMA Auditoria');
GO

-- 2. Crear Tabla de Logs
IF OBJECT_ID('Auditoria.Logs_Creditos', 'U') IS NULL
BEGIN
    CREATE TABLE Auditoria.Logs_Creditos (
        IdLog INT IDENTITY(1,1) PRIMARY KEY,
        IdCredito INT NOT NULL,
        Accion VARCHAR(100) NOT NULL,
        ValorAnterior VARCHAR(255) NULL,
        ValorNuevo VARCHAR(255) NULL,
        FechaHora DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

-- 3. Crear Trigger de Auditoría sobre Operaciones.Creditos
IF OBJECT_ID('Operaciones.TR_Creditos_AuditoriaTasa', 'TR') IS NOT NULL
    DROP TRIGGER Operaciones.TR_Creditos_AuditoriaTasa;
GO

CREATE TRIGGER Operaciones.TR_Creditos_AuditoriaTasa
ON Operaciones.Creditos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Registrar modificaciones en TasaInteresMensual
    IF UPDATE(TasaInteresMensual)
    BEGIN
        INSERT INTO Auditoria.Logs_Creditos (IdCredito, Accion, ValorAnterior, ValorNuevo, FechaHora)
        SELECT 
            i.IdCredito,
            'Modificación Tasa Interés',
            CAST(d.TasaInteresMensual AS VARCHAR(50)),
            CAST(i.TasaInteresMensual AS VARCHAR(50)),
            GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.IdCredito = d.IdCredito
        WHERE i.TasaInteresMensual <> d.TasaInteresMensual;
    END
END;
GO
SELECT * FROM Operaciones.vw_AtencionAlCliente;
EXEC Operaciones.SP_ProcesarPago @IdCredito = 2, @MontoAbono = 500.00;
-- Modificas la tasa de un préstamo manualmente:
UPDATE Operaciones.Creditos
SET TasaInteresMensual = 1.25
WHERE IdCredito = 2;

-- Consultas la bitácora para ver cómo el trigger atrapó el cambio:
SELECT * FROM Auditoria.Logs_Creditos;