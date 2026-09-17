-- ============================================================================
-- PROYECTO CREDICORE - FASE 1: CIMIENTOS DE TITANIO (CORREGIDO)
-- Estudiante: Karla Mariela Palax Tuy
-- Repositorio: DB1-CrediCore-2026
-- ============================================================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CrediCoreDB')
BEGIN
    CREATE DATABASE CrediCoreDB;
END
GO

USE CrediCoreDB;
GO

-- Limpieza de tablas
IF OBJECT_ID('Operaciones.Creditos', 'U') IS NOT NULL DROP TABLE Operaciones.Creditos;
IF OBJECT_ID('Garantias.Vehiculos', 'U') IS NOT NULL DROP TABLE Garantias.Vehiculos;
IF OBJECT_ID('Operaciones.Clientes', 'U') IS NOT NULL DROP TABLE Operaciones.Clientes;
GO

-- Esquemas
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Operaciones') EXEC('CREATE SCHEMA Operaciones');
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Garantias') EXEC('CREATE SCHEMA Garantias');
GO

-- 1. TABLA DE CLIENTES
CREATE TABLE Operaciones.Clientes (
    IdCliente INT IDENTITY(1,1) NOT NULL,
    DPI VARCHAR(13) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NULL,
    Correo VARCHAR(100) NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY (IdCliente),
    CONSTRAINT UQ_Clientes_DPI UNIQUE (DPI)
);
GO

-- 2. TABLA DE VEHÍCULOS
CREATE TABLE Garantias.Vehiculos (
    IdVehiculo INT IDENTITY(1,1) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    Color VARCHAR(30) NULL,
    NumeroTituloPropiedad VARCHAR(50) NOT NULL,
    Placa VARCHAR(20) NOT NULL,
    NumeroChasis VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Vehiculos PRIMARY KEY (IdVehiculo),
    CONSTRAINT UQ_Vehiculos_Placa UNIQUE (Placa),
    CONSTRAINT UQ_Vehiculos_Chasis UNIQUE (NumeroChasis),
    CONSTRAINT CK_Vehiculos_AnioMinimo CHECK (Anio >= 2011)
);
GO

-- 3. TABLA DE CRÉDITOS (Con claves foráneas y DATE)
CREATE TABLE Operaciones.Creditos (
    IdCredito INT IDENTITY(1,1) NOT NULL,
    IdCliente INT NOT NULL,
    IdVehiculo INT NOT NULL,
    MontoCapital DECIMAL(18,2) NOT NULL,
    TasaInteresMensual DECIMAL(5,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Activo',
    FechaDesembolso DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Creditos PRIMARY KEY (IdCredito),
    CONSTRAINT FK_Creditos_Clientes FOREIGN KEY (IdCliente) REFERENCES Operaciones.Clientes(IdCliente),
    CONSTRAINT FK_Creditos_Vehiculos FOREIGN KEY (IdVehiculo) REFERENCES Garantias.Vehiculos(IdVehiculo),
    CONSTRAINT CK_Creditos_MontoMinimo CHECK (MontoCapital > 1000.00),
    CONSTRAINT CK_Creditos_TasaNoNegativa CHECK (TasaInteresMensual >= 0.00)
);
GO