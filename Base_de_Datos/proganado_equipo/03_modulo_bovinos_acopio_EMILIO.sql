-- ============================================================================
-- PROGANADO SaaS - MODULO 3: El Hato, Identificacion Animal y Acopio Lechero
-- Integrante: Emilio (Operaciones & Gestion Caso Estudio)
-- Tablas: bovinos, marcaciones, entregas_acopio
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

-- 1. TABLA: bovinos (PK: VARCHAR(50), FKs: VARCHAR(50))
IF OBJECT_ID('dbo.bovinos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.bovinos (
        id_bovino VARCHAR(50) NOT NULL PRIMARY KEY,
        id_finca VARCHAR(50) NOT NULL,
        id_potrero VARCHAR(50) NULL,
        id_raza VARCHAR(50) NOT NULL,
        sexo VARCHAR(10) NOT NULL CONSTRAINT DF_bovinos_sexo DEFAULT 'Hembra'
            CONSTRAINT CK_bovinos_sexo CHECK (sexo IN ('Hembra', 'Macho')),
        estado_fisiologico VARCHAR(30) NOT NULL CONSTRAINT DF_bovinos_fisiologico DEFAULT 'Novilla_Vientre'
            CONSTRAINT CK_bovinos_fisiologico CHECK (estado_fisiologico IN ('En_Ordeño', 'Horra_Seca', 'Novilla_Vientre', 'Ternero_Crecimiento', 'Toro_Reproductor')),
        estado_vital VARCHAR(20) NOT NULL CONSTRAINT DF_bovinos_vital DEFAULT 'Activo'
            CONSTRAINT CK_bovinos_vital CHECK (estado_vital IN ('Activo', 'Muerto', 'Vendido', 'Descarte')),
        fecha_nacimiento DATE NOT NULL
    );
    PRINT 'Tabla bovinos creada exitosamente.';
END
GO

-- Vincular FKs de bovinos
IF OBJECT_ID('dbo.fincas', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_bovinos_fincas')
BEGIN
    ALTER TABLE dbo.bovinos ADD CONSTRAINT FK_bovinos_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca);
    PRINT 'FK_bovinos_fincas vinculada.';
END
IF OBJECT_ID('dbo.potreros', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_bovinos_potreros')
BEGIN
    ALTER TABLE dbo.bovinos ADD CONSTRAINT FK_bovinos_potreros FOREIGN KEY (id_potrero) REFERENCES dbo.potreros(id_potrero) ON DELETE SET NULL;
    PRINT 'FK_bovinos_potreros vinculada.';
END
IF OBJECT_ID('dbo.razas', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_bovinos_razas')
BEGIN
    ALTER TABLE dbo.bovinos ADD CONSTRAINT FK_bovinos_razas FOREIGN KEY (id_raza) REFERENCES dbo.razas(id_raza);
    PRINT 'FK_bovinos_razas vinculada.';
END
GO

-- 2. TABLA: marcaciones (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.marcaciones', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.marcaciones (
        id_marcacion VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_marca VARCHAR(30) NOT NULL
            CONSTRAINT CK_marcaciones_tipo CHECK (tipo_marca IN ('Arete_ICA', 'Arete_SINIGAN', 'Chapeta_Manejo', 'Hierro_Caliente', 'Tatuaje', 'Chip_RFID')),
        codigo_valor VARCHAR(50) NOT NULL,
        estado_activo BIT NOT NULL CONSTRAINT DF_marcaciones_activo DEFAULT 1
    );
    PRINT 'Tabla marcaciones creada exitosamente.';
END
GO

IF OBJECT_ID('dbo.bovinos', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_marcaciones_bovinos')
BEGIN
    ALTER TABLE dbo.marcaciones ADD CONSTRAINT FK_marcaciones_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino) ON DELETE CASCADE;
    PRINT 'FK_marcaciones_bovinos vinculada.';
END
GO

-- 3. TABLA: entregas_acopio (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.entregas_acopio', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.entregas_acopio (
        id_entrega VARCHAR(50) NOT NULL PRIMARY KEY,
        id_finca VARCHAR(50) NOT NULL,
        fecha_entrega DATE NOT NULL,
        litros_totales DECIMAL(7,2) NOT NULL,
        valor_bruto_est DECIMAL(10,2) NOT NULL,
        recuento_ufc INT NULL,
        numero_tiquete VARCHAR(50) NULL,
        litros_facturados DECIMAL(7,2) NULL,
        precio_litro_real DECIMAL(8,2) NULL,
        valor_pagado_real DECIMAL(10,2) NULL,
        diferencia_litros AS (litros_totales - ISNULL(litros_facturados, litros_totales))
    );
    PRINT 'Tabla entregas_acopio creada exitosamente.';
END
GO

IF OBJECT_ID('dbo.fincas', 'U') IS NOT NULL AND NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_entregas_fincas')
BEGIN
    ALTER TABLE dbo.entregas_acopio ADD CONSTRAINT FK_entregas_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE;
    PRINT 'FK_entregas_fincas vinculada.';
END
GO
