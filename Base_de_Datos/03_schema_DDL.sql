-- ============================================================================
-- PROYECTO INTEGRADOR CESDE - NIVEL 1
-- Módulo: Gestión de Bases de Datos
-- Proyecto: MiPrimeraEmpresa (Portal Formalización & Facturación)
-- Script: 03_schema_DDL.sql (Creación de Tablas y Restricciones)
-- ============================================================================

-- 1. TABLA: TIPO_REGIMEN (Catálogo Tributario DIAN)
CREATE TABLE IF NOT EXISTS TIPO_REGIMEN (
    id_tipo_regimen INT PRIMARY KEY AUTO_INCREMENT,
    nombre_regimen VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    aplica_iva BOOLEAN NOT NULL DEFAULT 0
);

-- 2. TABLA: EMPRESA (Microempresa Registrada)
CREATE TABLE IF NOT EXISTS EMPRESA (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nit_rut VARCHAR(20) NOT NULL UNIQUE,
    razon_social VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    id_tipo_regimen INT NOT NULL,
    FOREIGN KEY (id_tipo_regimen) REFERENCES TIPO_REGIMEN(id_tipo_regimen)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 3. TABLA: CLIENTE (Comprador/Consumidor)
CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    documento VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

-- 4. TABLA: PRODUCTO_SERVICIO (Catálogo de Oferta de la Microempresa)
CREATE TABLE IF NOT EXISTS PRODUCTO_SERVICIO (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_sku VARCHAR(50) NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    precio_unitario DECIMAL(12, 2) NOT NULL CHECK (precio_unitario >= 0),
    aplica_iva BOOLEAN NOT NULL DEFAULT 0,
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. TABLA: FACTURA (Encabezado de Venta)
CREATE TABLE IF NOT EXISTS FACTURA (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    numero_factura VARCHAR(30) NOT NULL UNIQUE,
    fecha_emision DATETIME NOT NULL,
    total_bruto DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    total_iva DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    total_neto DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    id_empresa INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 6. TABLA INTERMEDIA: DETALLE_FACTURA (Líneas de Compra M:N)
CREATE TABLE IF NOT EXISTS DETALLE_FACTURA (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(12, 2) NOT NULL,
    subtotal DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES FACTURA(id_factura)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO_SERVICIO(id_producto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ÍNDICES PARA OPTIMIZACIÓN DE BÚSQUEDAS
CREATE INDEX idx_empresa_nit ON EMPRESA(nit_rut);
CREATE INDEX idx_factura_numero ON FACTURA(numero_factura);
CREATE INDEX idx_producto_sku ON PRODUCTO_SERVICIO(codigo_sku);
