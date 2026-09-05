# 📝 Anotaciones de Clase - Gestión de Bases de Datos

**Fecha:** 8 de Agosto de 2026  
**Institución:** CESDE - Nivel 1  
**Módulo:** Gestión de Bases de Datos  
**Tema:** Ingeniería de Requisitos, MER vs MR, Simbología, Cardinalidad y Normalización (1FN, 2FN, 3FN)  
**Base de Datos Actual:** `cesde`

---

## 🔍 1. La Ciencia de Tomar Requisitos (Ingeniería de Requisitos)

La **Ingeniería de Requisitos** es la disciplina estructurada de la ingeniería de software dedicada a **descubrir, analizar, documentar, validar y gestionar** los requerimientos y necesidades de un cliente o negocio.

### Fases Principales:
1. **Elicitación / Levantamiento:** Descubrir necesidades mediante entrevistas, observación e historias de usuario.
2. **Análisis y Clasificación:**
   * **Requisitos Funcionales (RF):** Funciones directas del sistema *(ej: "El sistema debe registrar el ingreso del vehículo y generar ticket")*.
   * **Requisitos No Funcionales (RNF):** Calidad, rendimiento y restricciones *(ej: "El sistema debe responder en menos de 2 segundos y cifrar contraseñas")*.
3. **Especificación:** Traducir los requisitos a artefactos (Modelo Entidad-Relación, Wireframes, Historias de Usuario).
4. **Validación:** Confirmar con los usuarios/clientes que la especificación coincide con su necesidad real.
5. **Gestión de Cambios:** Controlar la evolución de los requisitos durante el ciclo de vida del proyecto.

---

## ⚔️ 2. Diferencia entre Modelo Entidad-Relación (MER) vs. Modelo Relacional (MR)

| Característica | Modelo Entidad-Relación (MER) | Modelo Relacional (MR) |
| :--- | :--- | :--- |
| **Nivel de Abstracción** | **Conceptual (Alto Nivel)** | **Lógico / Físico (Nivel Medio)** |
| **Objetivo** | Comprender el negocio y la información sin preocuparse por la tecnología. | Diseñar la estructura exacta que se implementará en el motor SQL. |
| **Componentes** | Entidades, Relaciones (rombos), Atributos (óvalos). | Tablas, Columnas, Filas (Tuplas). |
| **Claves Foráneas (FK)** | **NO** se dibujan ni representan como columnas explícitas. | **SÍ** se definen explícitamente las `FK` para enlazar las tablas. |
| **Relaciones N:M** | Se representan directamente entre dos entidades *(ej: Estudiante N:M Curso)*. | **NO se permiten:** Se rompen creando una **Tabla Intermedia / Rompimiento** (relación 1:N). |
| **Destinatario** | Clientes, Diseñadores, Analistas. | Desarrolladores, Administradores de BD (DBA). |

---

## 🛢️ 3. Simbología del Modelo Entidad-Relación (MER / DER)

| Elemento | Figura Gráfica | Descripción / Ejemplo |
| :--- | :---: | :--- |
| **Entidad** | **Rectángulo** ▭ | Objeto o concepto del mundo real. *(Ej: `Usuario`, `Curso`)* |
| **Relación** | **Rombo / Diamante** ♢ | Asociación entre entidades. *(Ej: `Inscribe`, `Pertenece`)* |
| **Atributo** | **Círculo / Óvalo** ◯ | Propiedad que describe a la entidad. *(Ej: `id`, `nombre`)* |
| **Base de Datos** | **Cilindro** 🛢️ | Representación gráfica global de la Base de Datos. |

---

## ⚠️ 4. Reglas Obligatorias para Nombrar una Base de Datos:
1. **NO usar la letra 'ñ' ni 'n'.**
2. **NO usar caracteres especiales** (ej: espacios, `#`, `$`, `@`, `%`, `!`, `-`, `/`, etc.).
3. **NO usar acentos ni tildes** (ej: `á`, `é`, `í`, `ó`, `ú`).
4. *Nombre asignado en clase:* **`cesde`**

---

## 🏗️ 5. Estructura de la Base de Datos `cesde`
1. `usuarios`
2. `TipoUsuario`
3. `UsuariosvsTipo` *(Tabla de rompimiento / intermedia)*
4. `Materias`
5. `Carreras`
6. `Sedes`

---

## 🔗 6. Las 3 Formas de Cardinalidad
* **1 : 1 (Uno a Uno):** Matrimonio (1 esposa ── 1 esposo).
* **1 : N (Uno a Muchos):** `Sede` (1) ── (N) `Carreras`.
* **N : M (Muchos a Muchos):** `Estudiante` (N) ── (M) `Cursos` *(Obliga a crear tabla de rompimiento)*.

---

## 📐 7. Reglas de Normalización
* **1FN:** Valores atómicos, PK única, sin duplicados.
* **2FN:** Cumple 1FN + Dependencia total de la PK.
* **3FN:** Cumple 2FN + Sin dependencias transitivas *(Obligatorio en Proyecto Integrador)*.
