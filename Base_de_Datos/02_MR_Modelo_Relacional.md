# 🗄️ Modelo Relacional (MR) — MiPrimeraEmpresa

**Proyecto:** MiPrimeraEmpresa (Portal de Formalización & Facturación)  
**Módulo:** Gestión de Bases de Datos (CESDE - Nivel 1)  
**Entrega:** Avance 1 (Semana 6 - 29 de Agosto)

---

## 📋 Esquema Relacional de Tablas (DDL Preview)

### Tabla: `TIPO_REGIMEN`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_tipo_regimen` | INT | NO | PK | Identificador único del régimen |
| `nombre_regimen` | VARCHAR(100) | NO | | Nombre fiscal (ej: No Responsable IVA) |
| `descripcion` | TEXT | SI | | Detalles normativos DIAN |
| `aplica_iva` | BOOLEAN | NO | | Indica si debe liquidar IVA (19%) |

---

### Tabla: `EMPRESA`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_empresa` | INT | NO | PK (AUTO) | ID de la microempresa |
| `nit_rut` | VARCHAR(20) | NO | UNIQUE | Número de Identificación Tributaria / CC |
| `razon_social` | VARCHAR(150) | NO | | Nombre comercial o legal |
| `direccion` | VARCHAR(200) | NO | | Dirección comercial |
| `telefono` | VARCHAR(20) | NO | | Teléfono de contacto |
| `email` | VARCHAR(100) | NO | | Correo para facturación |
| `fecha_registro` | DATE | NO | | Fecha de inscripción en plataforma |
| `id_tipo_regimen` | INT | NO | FK | Referencia a `TIPO_REGIMEN.id_tipo_regimen` |

---

### Tabla: `CLIENTE`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_cliente` | INT | NO | PK (AUTO) | ID único de cliente |
| `documento` | VARCHAR(20) | NO | UNIQUE | NIT/Cédula del cliente |
| `nombre_completo` | VARCHAR(150) | NO | | Nombre o razón social del cliente |
| `email` | VARCHAR(100) | NO | | Correo electrónico |
| `telefono` | VARCHAR(20) | SI | | Teléfono de contacto |

---

### Tabla: `PRODUCTO_SERVICIO`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_producto` | INT | NO | PK (AUTO) | ID del ítem |
| `codigo_sku` | VARCHAR(50) | NO | | Código interno o SKU |
| `nombre` | VARCHAR(120) | NO | | Descripción del bien o servicio |
| `precio_unitario` | DECIMAL(12,2) | NO | | Precio de venta antes de IVA |
| `aplica_iva` | BOOLEAN | NO | | Flag individual de IVA por ítem |
| `id_empresa` | INT | NO | FK | Referencia a `EMPRESA.id_empresa` |

---

### Tabla: `FACTURA`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_factura` | INT | NO | PK (AUTO) | ID de factura |
| `numero_factura` | VARCHAR(30) | NO | UNIQUE | Consecutivo de facturación |
| `fecha_emision` | DATETIME | NO | | Fecha y hora de generación |
| `total_bruto` | DECIMAL(12,2) | NO | | Suma de subtotales |
| `total_iva` | DECIMAL(12,2) | NO | | Valor total del IVA |
| `total_neto` | DECIMAL(12,2) | NO | | Total a pagar por el cliente |
| `id_empresa` | INT | NO | FK | Referencia a `EMPRESA.id_empresa` |
| `id_cliente` | INT | NO | FK | Referencia a `CLIENTE.id_cliente` |

---

### Tabla: `DETALLE_FACTURA`
| Campo | Tipo Dato | Nulo | Clave | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_detalle` | INT | NO | PK (AUTO) | ID de línea de detalle |
| `id_factura` | INT | NO | FK | Referencia a `FACTURA.id_factura` |
| `id_producto` | INT | NO | FK | Referencia a `PRODUCTO_SERVICIO.id_producto` |
| `cantidad` | INT | NO | | Cantidad de unidades vendidas |
| `precio_unitario` | DECIMAL(12,2) | NO | | Precio congelado al momento de venta |
| `subtotal` | DECIMAL(12,2) | NO | | `cantidad * precio_unitario` |

---

## 🔗 Diccionario de Relaciones y Cardinalidades

1. `TIPO_REGIMEN (1) ── (N) EMPRESA`: Un régimen fiscal puede agrupar muchas microempresas. Una empresa pertenece a exactamente 1 régimen.
2. `EMPRESA (1) ── (N) PRODUCTO_SERVICIO`: Una empresa registra N productos/servicios. Cada producto pertenece a 1 empresa.
3. `EMPRESA (1) ── (N) FACTURA`: Una empresa emite N facturas. Cada factura es emitida por 1 sola empresa.
4. `CLIENTE (1) ── (N) FACTURA`: Un cliente puede tener N facturas registradas. Cada factura pertenece a 1 cliente.
5. `FACTURA (1) ── (N) DETALLE_FACTURA`: Una factura contiene 1 o más líneas de detalle.
6. `PRODUCTO_SERVICIO (1) ── (N) DETALLE_FACTURA`: Un producto puede figurar en N detalles de distintas facturas.
