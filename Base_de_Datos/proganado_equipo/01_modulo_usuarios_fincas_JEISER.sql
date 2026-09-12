-- ============================================================================
-- PROGANADO SaaS - MODULO 1: Seguridad, Fincas y Suscripciones
-- Integrante: Jeiser Gutiérrez (Tech Lead / Arquitecto)
-- Tablas: usuarios, fincas, suscripciones_saas
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

-- 1. TABLA: usuarios (PK: VARCHAR(50))
IF OBJECT_ID('dbo.usuarios', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.usuarios (
        id_usuario VARCHAR(50) NOT NULL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        contrasena_hash VARCHAR(255) NOT NULL,
        rol VARCHAR(30) NOT NULL CONSTRAINT DF_usuarios_rol DEFAULT 'Administrador'
            CONSTRAINT CK_usuarios_rol CHECK (rol IN ('Administrador', 'Asistente', 'Veterinario', 'Operario')),
        fecha_registro DATETIME2 NOT NULL CONSTRAINT DF_usuarios_fecha DEFAULT SYSDATETIME()
    );
    PRINT 'Tabla usuarios creada exitosamente.';
END
GO

-- 2. TABLA: fincas (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.fincas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.fincas (
        id_finca VARCHAR(50) NOT NULL PRIMARY KEY,
        id_usuario VARCHAR(50) NOT NULL,
        nombre_finca VARCHAR(100) NOT NULL,
        documento_titular VARCHAR(30) NOT NULL,
        codigo_ica_predio VARCHAR(50) NOT NULL UNIQUE,
        municipio VARCHAR(100) NOT NULL CONSTRAINT DF_fincas_municipio DEFAULT 'Santa Rosa de Osos',
        CONSTRAINT FK_fincas_usuarios FOREIGN KEY (id_usuario) 
            REFERENCES dbo.usuarios(id_usuario)
    );
    PRINT 'Tabla fincas creada exitosamente.';
END
GO

-- 3. TABLA: suscripciones_saas (PK: VARCHAR(50), FK: VARCHAR(50))
IF OBJECT_ID('dbo.suscripciones_saas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.suscripciones_saas (
        id_suscripcion VARCHAR(50) NOT NULL PRIMARY KEY,
        id_finca VARCHAR(50) NOT NULL,
        plan_tipo VARCHAR(30) NOT NULL CONSTRAINT DF_suscripciones_plan DEFAULT 'Free'
            CONSTRAINT CK_suscripciones_plan CHECK (plan_tipo IN ('Free', 'Pro_119k', 'Multi_Predio_299k')),
        estado_acceso VARCHAR(30) NOT NULL CONSTRAINT DF_suscripciones_estado DEFAULT 'Activo'
            CONSTRAINT CK_suscripciones_estado CHECK (estado_acceso IN ('Activo', 'Solo_Lectura', 'Suspendido')),
        limite_vacas INT NOT NULL CONSTRAINT DF_suscripciones_limite DEFAULT 15,
        fecha_inicio DATE NOT NULL,
        fecha_vencimiento DATE NULL,
        CONSTRAINT FK_suscripciones_fincas FOREIGN KEY (id_finca) 
            REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE
    );
    PRINT 'Tabla suscripciones_saas creada exitosamente.';
END
GO
