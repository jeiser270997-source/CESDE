-- ============================================================================
-- PROGANADO SaaS - SCRIPT MAESTRO COMPLETO (12 TABLAS 3FN)
-- Paridad 100% con Modelo Relacional y DBML Oficial (VARCHAR PKs y FKs)
-- Motor: Microsoft SQL Server 2022 (T-SQL)
-- ============================================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PROGANADO2')
BEGIN
    CREATE DATABASE PROGANADO2;
    PRINT 'Base de datos PROGANADO2 creada exitosamente.';
END
GO

USE PROGANADO2;
GO

-- 1. usuarios
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
END
GO

-- 2. fincas
IF OBJECT_ID('dbo.fincas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.fincas (
        id_finca VARCHAR(50) NOT NULL PRIMARY KEY,
        id_usuario VARCHAR(50) NOT NULL,
        nombre_finca VARCHAR(100) NOT NULL,
        documento_titular VARCHAR(30) NOT NULL,
        codigo_ica_predio VARCHAR(50) NOT NULL UNIQUE,
        municipio VARCHAR(100) NOT NULL CONSTRAINT DF_fincas_municipio DEFAULT 'Santa Rosa de Osos',
        CONSTRAINT FK_fincas_usuarios FOREIGN KEY (id_usuario) REFERENCES dbo.usuarios(id_usuario)
    );
END
GO

-- 3. suscripciones_saas
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
        CONSTRAINT FK_suscripciones_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE
    );
END
GO

-- 4. potreros
IF OBJECT_ID('dbo.potreros', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.potreros (
        id_potrero VARCHAR(50) NOT NULL PRIMARY KEY,
        id_finca VARCHAR(50) NOT NULL,
        nombre_potrero VARCHAR(100) NOT NULL,
        dias_ocupacion INT NOT NULL CONSTRAINT DF_potreros_ocupacion DEFAULT 1,
        dias_descanso_prv INT NOT NULL CONSTRAINT DF_potreros_descanso DEFAULT 35,
        CONSTRAINT FK_potreros_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE
    );
END
GO

-- 5. razas
IF OBJECT_ID('dbo.razas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.razas (
        id_raza VARCHAR(50) NOT NULL PRIMARY KEY,
        nombre_raza VARCHAR(100) NOT NULL UNIQUE,
        descripcion_proposito VARCHAR(255) NOT NULL
    );
END
GO

-- 6. medicamentos
IF OBJECT_ID('dbo.medicamentos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.medicamentos (
        id_medicamento VARCHAR(50) NOT NULL PRIMARY KEY,
        nombre_farmaco VARCHAR(120) NOT NULL UNIQUE,
        dias_retiro_ica INT NOT NULL CONSTRAINT CK_medicamentos_retiro CHECK (dias_retiro_ica >= 0)
    );
END
GO

-- 7. bovinos
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
        fecha_nacimiento DATE NOT NULL,
        CONSTRAINT FK_bovinos_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca),
        CONSTRAINT FK_bovinos_potreros FOREIGN KEY (id_potrero) REFERENCES dbo.potreros(id_potrero) ON DELETE SET NULL,
        CONSTRAINT FK_bovinos_razas FOREIGN KEY (id_raza) REFERENCES dbo.razas(id_raza)
    );
END
GO

-- 8. marcaciones
IF OBJECT_ID('dbo.marcaciones', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.marcaciones (
        id_marcacion VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_marca VARCHAR(30) NOT NULL
            CONSTRAINT CK_marcaciones_tipo CHECK (tipo_marca IN ('Arete_ICA', 'Arete_SINIGAN', 'Chapeta_Manejo', 'Hierro_Caliente', 'Tatuaje', 'Chip_RFID')),
        codigo_valor VARCHAR(50) NOT NULL,
        estado_activo BIT NOT NULL CONSTRAINT DF_marcaciones_activo DEFAULT 1,
        CONSTRAINT FK_marcaciones_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino) ON DELETE CASCADE
    );
END
GO

-- 9. entregas_acopio
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
        diferencia_litros AS (litros_totales - ISNULL(litros_facturados, litros_totales)),
        CONSTRAINT FK_entregas_fincas FOREIGN KEY (id_finca) REFERENCES dbo.fincas(id_finca) ON DELETE CASCADE
    );
END
GO

-- 10. tratamientos_sanitarios
IF OBJECT_ID('dbo.tratamientos_sanitarios', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.tratamientos_sanitarios (
        id_tratamiento VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_procedimiento VARCHAR(100) NOT NULL,
        id_medicamento VARCHAR(50) NULL,
        fecha_tratamiento DATE NOT NULL,
        dosis_ml DECIMAL(5,2) NULL,
        CONSTRAINT FK_tratamientos_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino),
        CONSTRAINT FK_tratamientos_medicamentos FOREIGN KEY (id_medicamento) REFERENCES dbo.medicamentos(id_medicamento)
    );
END
GO

-- 11. pesajes_leche
IF OBJECT_ID('dbo.pesajes_leche', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.pesajes_leche (
        id_pesaje VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        fecha_pesaje DATE NOT NULL,
        hora_pesaje TIME NOT NULL,
        litros_obtenidos DECIMAL(5,2) NOT NULL CONSTRAINT CK_pesajes_litros CHECK (litros_obtenidos >= 0),
        CONSTRAINT FK_pesajes_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino),
        CONSTRAINT UQ_pesaje_bovino_momento UNIQUE (id_bovino, fecha_pesaje, hora_pesaje)
    );
END
GO

-- 12. eventos_reproductivos
IF OBJECT_ID('dbo.eventos_reproductivos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.eventos_reproductivos (
        id_evento VARCHAR(50) NOT NULL PRIMARY KEY,
        id_bovino VARCHAR(50) NOT NULL,
        tipo_evento VARCHAR(30) NOT NULL
            CONSTRAINT CK_eventos_tipo CHECK (tipo_evento IN ('Parto', 'Celo_Observable', 'Inseminacion', 'Palpacion', 'Aborto')),
        fecha_evento DATE NOT NULL,
        dias_abiertos_calc INT NULL,
        CONSTRAINT FK_eventos_bovinos FOREIGN KEY (id_bovino) REFERENCES dbo.bovinos(id_bovino)
    );
END
GO

PRINT '=============================================================================';
PRINT '✅ ESQUEMA PROGANADO2 (12 TABLAS 3FN CON VARCHAR/STRINGS) COMPILADO CON ÉXITO';
PRINT '=============================================================================';
