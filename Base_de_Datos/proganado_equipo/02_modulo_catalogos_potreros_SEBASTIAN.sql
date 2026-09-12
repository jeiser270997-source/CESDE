-- ============================================================================
-- PROGANADO SaaS - MODULO 2: Predio, Suelos y Catalogos Sanitarios
-- Integrante: Sebastián (Frontend Lead / Data Support)
-- Tablas: potreros, razas, medicamentos
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

-- 1. TABLA: razas (PK: VARCHAR(50))
IF OBJECT_ID('dbo.razas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.razas (
        id_raza VARCHAR(50) NOT NULL PRIMARY KEY,
        nombre_raza VARCHAR(100) NOT NULL UNIQUE,
        descripcion_proposito VARCHAR(255) NOT NULL
    );
    PRINT 'Tabla razas creada exitosamente.';
END
GO

-- 2. TABLA: medicamentos (PK: VARCHAR(50))
IF OBJECT_ID('dbo.medicamentos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.medicamentos (
        id_medicamento VARCHAR(50) NOT NULL PRIMARY KEY,
        nombre_farmaco VARCHAR(120) NOT NULL UNIQUE,
        dias_retiro_ica INT NOT NULL CONSTRAINT CK_medicamentos_retiro CHECK (dias_retiro_ica >= 0)
    );
    PRINT 'Tabla medicamentos creada exitosamente.';
END
GO

-- 3. TABLA: potreros (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.potreros', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.potreros (
        id_potrero VARCHAR(50) NOT NULL PRIMARY KEY,
        id_finca VARCHAR(50) NOT NULL,
        nombre_potrero VARCHAR(100) NOT NULL,
        dias_ocupacion INT NOT NULL CONSTRAINT DF_potreros_ocupacion DEFAULT 1,
        dias_descanso_prv INT NOT NULL CONSTRAINT DF_potreros_descanso DEFAULT 35
    );
    PRINT 'Tabla potreros creada exitosamente.';
END
GO

-- Enlazar Clave Foranea con fincas (si la tabla fincas ya existe)
IF OBJECT_ID('dbo.fincas', 'U') IS NOT NULL AND NOT EXISTS (
    SELECT * FROM sys.foreign_keys WHERE name = 'FK_potreros_fincas'
)
BEGIN
    ALTER TABLE dbo.potreros 
    ADD CONSTRAINT FK_potreros_fincas FOREIGN KEY (id_finca) 
    REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE;
    PRINT 'Clave foranea FK_potreros_fincas vinculada correctamente.';
END
ELSE IF OBJECT_ID('dbo.fincas', 'U') IS NULL
BEGIN
    PRINT 'Aviso: La tabla fincas aun no existe. La tabla potreros fue creada; su FK se vinculara al ejecutar el Modulo 1.';
END
GO
