-- ============================================================================
-- PROGANADO SaaS - MODULO 4: Sanidad, Telemetria Lechera y Reproduccion
-- Integrante: Humberto (Auditoria & Calidad)
-- Tablas: tratamientos_sanitarios, pesajes_leche, eventos_reproductivos
-- Motor: Microsoft SQL Server (T-SQL) - Paridad 100% con Modelo Relacional
-- ============================================================================

-- 0. CREAR BASE DE DATOS SI NO EXISTE
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PROGANADO2')
BEGIN
    CREATE DATABASE PROGANADO2;
    PRINT 'Base de datos PROGANADO2 creada exitosamente.';
END
GO

USE PROGANADO2;
GO

-- 1. TABLA: tratamientos_sanitarios (PK: VARCHAR(50), FKs: VARCHAR(50))
IF OBJECT_ID('dbo.tratamientos_sanitarios', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.tratamientos_sanitarios (
        id_tratamiento VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_procedimiento VARCHAR(100) NOT NULL,
        id_medicamento VARCHAR(50) NULL,
        fecha_tratamiento DATE NOT NULL,
        dosis_ml DECIMAL(5,2) NULL
    );
    PRINT 'Tabla tratamientos_sanitarios creada exitosamente.';
END
GO

IF OBJECT_ID('dbo.bovinos', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_tratamientos_bovinos')
BEGIN
    ALTER TABLE dbo.tratamientos_sanitarios ADD CONSTRAINT FK_tratamientos_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino);
    PRINT 'FK_tratamientos_bovinos vinculada.';
END
IF OBJECT_ID('dbo.medicamentos', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_tratamientos_medicamentos')
BEGIN
    ALTER TABLE dbo.tratamientos_sanitarios ADD CONSTRAINT FK_tratamientos_medicamentos FOREIGN KEY (id_medicamento) REFERENCES dbo.medicamentos(id_medicamento);
    PRINT 'FK_tratamientos_medicamentos vinculada.';
END
GO

-- 2. TABLA: pesajes_leche (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.pesajes_leche', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.pesajes_leche (
        id_pesaje VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        fecha_pesaje DATE NOT NULL,
        hora_pesaje TIME NOT NULL,
        litros_obtenidos DECIMAL(5,2) NOT NULL CONSTRAINT CK_pesajes_litros CHECK (litros_obtenidos >= 0),
        CONSTRAINT UQ_pesaje_bovino_momento UNIQUE (id_bovino, fecha_pesaje, hora_pesaje)
    );
    PRINT 'Tabla pesajes_leche creada exitosamente.';
END
GO

IF OBJECT_ID('dbo.bovinos', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_pesajes_bovinos')
BEGIN
    ALTER TABLE dbo.pesajes_leche ADD CONSTRAINT FK_pesajes_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino);
    PRINT 'FK_pesajes_bovinos vinculada.';
END
GO

-- 3. TABLA: eventos_reproductivos (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.eventos_reproductivos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.eventos_reproductivos (
        id_evento VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_evento VARCHAR(30) NOT NULL
            CONSTRAINT CK_eventos_tipo CHECK (tipo_evento IN ('Parto', 'Celo_Observable', 'Inseminacion', 'Palpacion', 'Aborto')),
        fecha_evento DATE NOT NULL,
        dias_abiertos_calc INT NULL
    );
    PRINT 'Tabla eventos_reproductivos creada exitosamente.';
END
GO

IF OBJECT_ID('dbo.bovinos', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_eventos_bovinos')
BEGIN
    ALTER TABLE dbo.eventos_reproductivos ADD CONSTRAINT FK_eventos_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino);
    PRINT 'FK_eventos_bovinos vinculada.';
END
GO
