# 🐄 Distribución de Módulos DDL - ProGanado (CESDE Nivel 1)

**Proyecto:** ProGanado SaaS (Gestión Ganadera y Trazabilidad Lechera)  
**Motor:** Microsoft SQL Server 2022 (T-SQL)  
**Base de Datos:** `PROGANADO2` (o la que asigne el profesor)  
**Arquitectura:** 12 Tablas Normalizadas en 3FN (Tercera Forma Normal)  

---

## 👥 Asignación Equitativa por Integrante (3 Tablas c/u)

Debido a las **Claves Foráneas (Foreign Keys)**, los scripts deben ejecutarse en orden del **Módulo 1 al Módulo 4** si se corren en una misma base de datos.

| Módulo | Integrante | Tablas Asignadas | Dominio de Negocio | Archivo SQL |
| :--- | :--- | :--- | :--- | :--- |
| **Módulo 1** | **Jeiser Gutiérrez** | `usuarios`, `fincas`, `suscripciones_saas` | Seguridad, Predios y Acceso SaaS (Padres Raíz) | `01_modulo_usuarios_fincas_JEISER.sql` |
| **Módulo 2** | **Sebastián** | `potreros`, `razas`, `medicamentos` | Rotación PRV y Catálogos Sanitarios/Genéticos | `02_modulo_catalogos_potreros_SEBASTIAN.sql` |
| **Módulo 3** | **Emilio** | `bovinos`, `marcaciones`, `entregas_acopio` | Ficha del Ganado, Chapetas/Aretes y Acopio Colanta | `03_modulo_bovinos_acopio_EMILIO.sql` |
| **Módulo 4** | **Humberto** | `tratamientos_sanitarios`, `pesajes_leche`, `eventos_reproductivos` | Inocuidad Cinta Roja, Telemetría de Ordeño y Reproducción | `04_modulo_sanidad_produccion_HUMBERTO.sql` |

---

## 🚀 Instrucciones para Compartir con el Equipo

1. Si cada compañero está en su propia PC con SSMS:
   - Pueden abrir su respectivo archivo `.sql` en SQL Server Management Studio.
   - Si van a enlazar claves foráneas, necesitan que las tablas padre existan previamente o pueden ejecutar todos los módulos en su máquina para tener el esquema completo.
2. Cada archivo contiene:
   - Tipos nativos de SQL Server (`INT IDENTITY(1,1)`, `VARCHAR`, `DECIMAL`, `BIT`, `DATE`, `TIME`, `DATETIME2`).
   - Restricciones con nombre explícito (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `DEFAULT`).
   - Verificación previa (`IF OBJECT_ID(...) IS NULL`) para evitar errores si la tabla ya existe.
