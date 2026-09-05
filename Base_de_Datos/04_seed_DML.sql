-- ============================================================================
-- PROYECTO INTEGRADOR CESDE - NIVEL 1
-- Módulo: Gestión de Bases de Datos
-- Proyecto: MiPrimeraEmpresa (Portal Formalización & Facturación)
-- Script: 04_seed_DML.sql (Inserción de Datos Iniciales)
-- ============================================================================

-- 1. POBLAR REGÍMENES TRIBUTARIOS DIAN
INSERT INTO TIPO_REGIMEN (id_tipo_regimen, nombre_regimen, descripcion, aplica_iva) VALUES
(1, 'Persona Natural - No Responsables IVA', 'Microempresas con ingresos anuales inferiores a 3.500 UVT.', 0),
(2, 'Régimen Simple de Tributación (RST)', 'Modelo unificado de impuestos para formalización rápida.', 1),
(3, 'Responsable de IVA (Régimen Común)', 'Empresas constituidas como S.A.S. o con ingresos superiores a 3.500 UVT.', 1);

-- 2. POBLAR MICROEMPRESAS
INSERT INTO EMPRESA (id_empresa, nit_rut, razon_social, direccion, telefono, email, fecha_registro, id_tipo_regimen) VALUES
(1, '1019156838-1', 'Chorizos Artesanales Don Juan', 'Calle 50 #45-12, Medellín', '3044615613', 'contacto@donjuanchorizos.co', '2026-08-01', 1),
(2, '901234567-8', 'Servicios Contables E-Contable S.A.S.', 'Carrera 43A #1-50, Envigado', '6044445566', 'facturacion@e-contable.com', '2026-08-05', 2),
(3, '1020304050-2', 'TecnoFix Mantenimiento PC', 'Calle 10 #30-15, Itagüí', '3109876543', 'soporte@tecnofix.co', '2026-08-08', 1);

-- 3. POBLAR CLIENTES
INSERT INTO CLIENTE (id_cliente, documento, nombre_completo, email, telefono) VALUES
(1, '712595289', 'Carlos Restrepo', 'crestrepo@gmail.com', '3001112233'),
(2, '900555666', 'Restaurante La Sazón Paisa S.A.S.', 'compras@lasazonpaisa.com', '6043219876'),
(3, '43555666', 'María Fernanda Gómez', 'mafe.gomez@hotm.com', '3157778899');

-- 4. POBLAR CATÁLOGO DE PRODUCTOS / SERVICIOS
INSERT INTO PRODUCTO_SERVICIO (id_producto, codigo_sku, nombre, precio_unitario, aplica_iva, id_empresa) VALUES
(1, 'CHOR-001', 'Paquete Chorizo Artesanal x 5 uds', 25000.00, 0, 1),
(2, 'CHOR-002', 'Combo Fiesta Chorizos x 20 uds', 85000.00, 0, 1),
(3, 'CONT-101', 'Asesoría Inicial de Formalización RUT', 150000.00, 1, 2),
(4, 'TECN-201', 'Mantenimiento Preventivo de Computador', 80000.00, 0, 3);

-- 5. POBLAR FACTURAS SIMULADAS
INSERT INTO FACTURA (id_factura, numero_factura, fecha_emision, total_bruto, total_iva, total_neto, id_empresa, id_cliente) VALUES
(1, 'FE-2026-0001', '2026-08-09 10:30:00', 50000.00, 0.00, 50000.00, 1, 1),
(2, 'FE-2026-0002', '2026-08-09 11:15:00', 150000.00, 28500.00, 178500.00, 2, 2);

-- 6. POBLAR DETALLES DE FACTURA
INSERT INTO DETALLE_FACTURA (id_detalle, id_factura, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 2, 25000.00, 50000.00),
(2, 2, 3, 1, 150000.00, 150000.00);
