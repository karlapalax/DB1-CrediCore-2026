-- ============================================================================
-- PROYECTO CREDICORE - FASE 3: EL TEJIDO RELACIONAL Y ANÁLISIS ESTRATÉGICO
-- Estudiante: Karla Mariela Palax Tuy
-- Repositorio: DB1-CrediCore-2026
-- ============================================================================
USE CrediCoreDB;
GO

-- 1. ELIMINAR RESTRICCIONES SI YA EXISTEN (Para evitar conflictos al reejecutar)
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Creditos_Clientes')
    ALTER TABLE Operaciones.Creditos DROP CONSTRAINT FK_Creditos_Clientes;
GO

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Creditos_Vehiculos')
    ALTER TABLE Operaciones.Creditos DROP CONSTRAINT FK_Creditos_Vehiculos;
GO

-- 2. ACTIVAR EL ESCUDO RELACIONAL (FOREIGN KEYS)
ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Clientes 
FOREIGN KEY (IdCliente) REFERENCES Operaciones.Clientes(IdCliente);
GO

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Vehiculos 
FOREIGN KEY (IdVehiculo) REFERENCES Garantias.Vehiculos(IdVehiculo);
GO
-- 3. LA PRUEBA DE DESTRUCCIÓN OBLIGATORIA
DELETE FROM Operaciones.Clientes WHERE IdCliente = 1;
GO

-- ============================================================================
-- PARTE B: RECONSTRUCCIÓN DE LA REALIDAD (JOINs)
-- ============================================================================

-- 1. El Reporte Maestro (INNER JOIN Triple entre Clientes, Créditos y Vehículos)
SELECT 
    C.Nombres + ' ' + C.Apellidos AS NombreCliente,
    C.Telefono,
    V.Marca,
    V.Placa,
    CR.MontoCapital,
    CR.Estado
FROM Operaciones.Creditos CR
INNER JOIN Operaciones.Clientes C ON CR.IdCliente = C.IdCliente
INNER JOIN Garantias.Vehiculos V ON CR.IdVehiculo = V.IdVehiculo;
GO

-- 2. Minería de Potenciales Clientes (LEFT JOIN buscando los NULL)
-- Clientes que NUNCA han solicitado un crédito
SELECT 
    C.Nombres,
    C.Apellidos,
    C.Telefono,
    C.Correo
FROM Operaciones.Clientes C
LEFT JOIN Operaciones.Creditos CR ON C.IdCliente = CR.IdCliente
WHERE CR.IdCredito IS NULL;
GO

-- ============================================================================
-- PARTE C: EL CEREBRO ANALÍTICO (Subconsultas)
-- ============================================================================

-- 0. AGREGAR DATOS DE PRUEBA (Vehículo 2011 y su crédito para el test con IN)
INSERT INTO Garantias.Vehiculos (Anio, Marca, Modelo, Color, NumeroTituloPropiedad, Placa, NumeroChasis)
VALUES (2011, 'Toyota', 'Hilux', 'Gris', 'TIT-2011-TEST', 'P-999ZZZ', 'CHS-999999');
GO

INSERT INTO Operaciones.Creditos (IdCliente, IdVehiculo, MontoCapital, TasaInteresMensual, Estado, FechaDesembolso)
VALUES (1, SCOPE_IDENTITY(), 15000.00, 2.00, 'Activo', GETDATE());
GO

-- 1. El Filtro Dinámico (Créditos con capital mayor al promedio histórico)
SELECT 
    IdCredito,
    IdCliente,
    MontoCapital,
    Estado
FROM Operaciones.Creditos
WHERE MontoCapital > (SELECT AVG(MontoCapital) FROM Operaciones.Creditos);
GO

-- 2. Patrones Anidados (Clientes con vehículos del año 2011 hacia atrás usando IN)
SELECT 
    C.Nombres + ' ' + C.Apellidos AS NombreCliente,
    CR.IdCredito
FROM Operaciones.Creditos CR
INNER JOIN Operaciones.Clientes C ON CR.IdCliente = C.IdCliente
WHERE CR.IdVehiculo IN (
    SELECT IdVehiculo 
    FROM Garantias.Vehiculos 
    WHERE Anio <= 2011
);
GO