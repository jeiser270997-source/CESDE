# CESDE — Síntesis y Respuestas Técnicas (Clase #3 — 22-Ago-2026)

---

## 1. Base de Datos (Docente: Felipe Piedrahita)

### Conceptos Clave
- **Base de Datos:** Conjunto de datos organizados, estructurados y persistentes en disco para consulta y gestión eficiente.
- **Motor vs SGBD:**
  - **Motor (RDBMS):** Núcleo de almacenamiento y procesamiento de consultas (MySQL, PostgreSQL, SQLite, MariaDB, Oracle).
  - **SGBD / Gestor:** Herramienta/interfaz para administrar el motor (DBeaver, phpMyAdmin, HeidiSQL, MySQL Workbench, SSMS).
- **Servidores Linux / Headless:** En producción los servidores operan 100% por CLI (línea de comandos) sin interfaz gráfica para maximizar rendimiento y seguridad.

### Respuestas a Dudas Anotadas en Clase
1. **¿Por qué nombres sin espacios y qué nomenclatura usar?**
   - Espacios obligan a usar comillas/backticks en SQL (`SELECT * FROM "Tipo Usuarios"`), propensos a errores y bloqueos de parsers.
   - **Estándar recomendado:** `snake_case` para tablas y campos (`tipo_usuarios`, `fecha_nacimiento`, `id_usuario`) o `PascalCase` para tablas (`TipoUsuarios`) y `camelCase` para columnas (`fechaNacimiento`).
2. **¿ID Autonumérico (Surrogate) vs Cédula / Documento (Natural Key)?**
   - **Clave Primaria (`id INT AUTO_INCREMENT`):** Inmutable, numérico (4 u 8 bytes, índices B-Tree ultra rápidos), inmune a errores de digitación o documentos extranjeros repetidos.
   - **Cédula / Documento:** Se guarda como columna `VARCHAR(20) UNIQUE`, indexada para búsqueda pero no como enlace de llaves foráneas.
3. **¿Fecha de Nacimiento vs Edad?**
   - **Regla de oro:** Almacenar siempre `fecha_nacimiento DATE`. La edad es un dato derivado que cambia cada 365 días.
   - Consulta dinámica: `TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad`.
4. **Tipos de Datos SQL Fundamentales:**
   - `INT` / `BIGINT`: Enteros para IDs, conteos, cantidades.
   - `DECIMAL(12,2)`: Para dinero y montos exactos (evita errores de redondeo de `FLOAT`/`DOUBLE`).
   - `VARCHAR(n)`: Cadenas de longitud variable (ahorra espacio).
   - `CHAR(n)`: Cadenas de longitud fija (códigos de 2 o 3 letras).
   - `DATE` / `TIMESTAMP`: Fechas y marcas de tiempo.

---

## 2. Introducción a la Programación / HTML5 (Docente: Liliana Vera)

### Conceptos Clave
- **HTML5:** Lenguaje de marcado de hipertexto. Define exclusivamente la **estructura** y semántica del documento (esqueleto).
- **CSS:** Se encarga de estilos, fuentes, colores, layout y responsividad (media queries, Flexbox, Grid).
- **`<!DOCTYPE html>`:** Declara que el documento sigue el estándar moderno HTML5. Si se omite, los navegadores activan *Quirks Mode* (modo retrocompatible impredecible).

### Respuestas a Dudas Anotadas en Clase
1. **Emmet Shortcut `table>tr*3>td*3`:**
   - El operador `>` significa "hijo de" (anidación).
   - Genera: 1 `<table>`, con 3 filas `<tr>` (table row), y cada fila con 3 celdas `<td>` (table data) = cuadrícula 3×3.
   - **Regla de jerarquía:** Estrictamente `table` > `tr` > `td`. En HTML **NO** se puede invertir (`td` no puede contener `tr`).
2. **Sincronización y Configuración de VS Code con GitHub:**
   - Activar **Settings Sync** en VS Code (icono de engranaje ➔ *Turn on Settings Sync* ➔ Iniciar sesión con GitHub).
   - Sincroniza extensiones, temas, snippets y keybindings en cualquier computadora automáticamente.

---

## 3. Lógica de Programación (PSeInt)

### Conceptos Clave
- **Dato:** Unidad mínima de información aislada (`5`, `"Juan"`, `'A'`, `Verdadero`).
- **Campo / Variable:** Espacio reservado en memoria RAM con un tipo de dato y un identificador único.
- **Constante:** Espacio en memoria cuyo valor permanece inalterable durante toda la ejecución (`PI = 3.141592`, `Euler = 2.71828`, `IVA = 0.19`).
- **Concatenación vs Suma:**
  - `"30" + "43" = "3043"` (Cadenas de texto / Alfanumérico).
  - `30 + 43 = 73` (Valores numéricos enteros).

### Jerarquía Estricta de Operadores
1. **Paréntesis:** `()` (de adentro hacia afuera).
2. **Potenciación y Radicación:** `^`, `RC()`.
3. **Multiplicación, División y Módulo:** `*`, `/`, `MOD` o `%`.
4. **Suma y Resta:** `+`, `-`.
5. **Operadores Relacionales:** `=`, `<>`, `<`, `<=`, `>`, `>=`.
6. **Operadores Lógicos:** `NO` (NOT) ➔ `Y` (AND) ➔ `O` (OR).

### Vector vs Matriz
- **Vector (Arreglo Unidimensional):** Estructura lineal de $1 \times N$ elementos indexados por una sola posición `V[i]`.
- **Matriz (Arreglo Bidimensional):** Estructura tabular de $M$ filas $\times N$ columnas indexadas por dos posiciones `M[fila, columna]`.

---

## 4. Estado de Entregables Proyecto Integrador (GanadoControl)
- **BD:** `schema_7_tablas_ganaderia.sql` (100% 3FN con tablas `fincas`, `lotes`, `bovinos`, `pesajes`, `sanidad`, `reproduccion`, `produccion_leche`).
- **Frontend HTML5:** `index.html` + `registro_bovino.html` (Semántica HTML5 pura + formularios validados).
- **Lógica PSeInt:** `asistente_ganadero_refactorizado.psc` (Modular, cálculo de promedios, alertas sanitarias y conversión de pesos).
- **Documentación & Slides:** `GanadoControl_CESDE_2026-2.pdf` y `.pptx` listos para Momento 1 (29-Ago).
