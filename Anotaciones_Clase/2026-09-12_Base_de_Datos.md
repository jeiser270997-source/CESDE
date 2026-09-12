# 📝 Anotaciones de Clase - Gestión de Bases de Datos

**Fecha:** 12 de Septiembre de 2026  
**Institución:** CESDE - Nivel 1  
**Módulo:** Gestión de Bases de Datos  
**Tema:** Implementación Física en SQL Server (T-SQL), Distribución de Esquema DDL en Equipo y Diagramación  
**Motor:** Microsoft SQL Server 2022 (Developer Edition 64-bit)  
**Base de Datos:** `PROGANADO2`  
**Ubicación de Scripts:** `cesde/Base_de_Datos/proganado_equipo/`  

---

## 🛢️ 1. Entorno de Producción Local (SQL Server en Laboratorio CESDE)
* **Instancia:** `MSSQLSERVER` (Conexión vía `.` o `localhost`).
* **Autenticación:** *Windows Authentication* (sin requerir contraseñas locales).
* **Herramientas:** SQL Server Management Studio 19 (SSMS) y SQLCMD.
* **Propietario de Base de Datos:** Para evitar errores de permisos al crear diagramas en SSMS, se fijó la autorización explícita:
  ```sql
  ALTER AUTHORIZATION ON DATABASE::PROGANADO2 TO [ACADEMICOS\desarrollo];
  ```

---

## 🐄 2. Implementación de ProGanado SaaS (12 Tablas en 3FN)

El sistema opera bajo el estándar de **Tercera Forma Normal (3FN)** con paridad 100% con el modelo entregado en el Momento 1:

### ⚠️ Regla de Oro de Tipos de Datos (Paridad con el Modelo Relacional):
* Las claves primarias (`PK`) y foráneas (`FK`) se definieron como **`VARCHAR(50)`** (identificadores alfanuméricos / UUIDs como `'usr_01'`, `'fca_01'`, `'bov_01'`), y **NO como enteros autoincrementales (`INT IDENTITY`)**, para mantener concordancia estricta con el diagrama DBML y PDF oficial del proyecto.

---

## 👥 3. Distribución Modular del Equipo (3 Tablas c/u)

Debido a la integridad referencial (`FOREIGN KEY`), el orden de ejecución en una base compartida es estrictamente secuencial:

| Módulo | Integrante | Tablas Asignadas | Dominio de Negocio | Archivo Generado |
| :---: | :--- | :--- | :--- | :--- |
| **1** | **Jeiser Gutiérrez** | `usuarios`, `fincas`, `suscripciones_saas` | Seguridad, Predios y Acceso SaaS (Padres Raíz) | `01_modulo_usuarios_fincas_JEISER.sql` |
| **2** | **Sebastián** | `potreros`, `razas`, `medicamentos` | Rotación PRV y Catálogos Sanitarios/Genéticos | `02_modulo_catalogos_potreros_SEBASTIAN.sql` |
| **3** | **Emilio** | `bovinos`, `marcaciones`, `entregas_acopio` | Ficha del Ganado, Chapetas/Aretes y Acopio Colanta | `03_modulo_bovinos_acopio_EMILIO.sql` |
| **4** | **Humberto** | `tratamientos_sanitarios`, `pesajes_leche`, `eventos_reproductivos` | Inocuidad Cinta Roja, Telemetría de Ordeño y Reproducción | `04_modulo_sanidad_produccion_HUMBERTO.sql` |

* **Script Maestro Unificado:** `00_SCRIPT_MAESTRO_PROGANADO2_COMPLETO.sql` (ejecuta todo el modelo de 1 clic).

---

## 📊 4. Diagramación en SQL Server Management Studio
* En SSMS, las bases de datos nuevas no tienen habilitados los objetos de diagramación por defecto.
* **Paso a paso:**
  1. Clic derecho en `Diagramas de base de datos` ➔ `Nuevo diagrama de base de datos`.
  2. Confirmar la creación de los objetos de compatibilidad (`sysdiagrams`).
  3. Seleccionar las tablas del módulo y agregar.
  4. Guardar como `Diagrama_Modulo1_Jeiser`.
