# 🎯 GUÍA DE ESTUDIO Y PRÁCTICA PARA EL EXAMEN DE HTML5
**Docente:** Jonathan Felipe Piedrahita Nieto | **Módulo:** Introducción a la Programación (CESDE)
**Estudiante:** Jeiser Abraham Gutiérrez

---

## 📌 1. ESTRUCTURA BÁSICA Y METADATOS OBLIGATORIOS
```html
<!DOCTYPE html>              <!-- Indica al navegador que es HTML5 -->
<html lang="es">             <!-- Idioma del documento -->
<head>
  <meta charset="UTF-8">     <!-- Codificación de caracteres (acentos, ñ) -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Mobile First / Responsive -->
  <title>Título Pestaña</title>
</head>
<body>
  <!-- Contenido visible -->
</body>
</html>
```

---

## 📌 2. ETIQUETAS SEMÁNTICAS (ESTRUCTURA DEL SITIO)
- `<header>`: Encabezado de la página o de una sección (lleva `<h1>` y `<nav>`).
- `<nav>`: Bloque con los enlaces del menú de navegación (`<a>`).
- `<main>`: Contenedor del contenido principal único de la página.
- `<section>`: Agrupa contenido temático relacionado.
- `<article>`: Bloque de contenido independiente y autónomo (ej: noticia, post).
- `<aside>`: Barra lateral o contenido complementario.
- `<footer>`: Pie de página (créditos, copyright, contacto).
- `<figure>` y `<figcaption>`: Contenedor para imágenes con su pie descriptivo.

---

## 📌 3. ELEMENTOS DE TEXTO Y JERARQUÍA
- `<h1>` a `<h6>`: Jerarquía de títulos (sólo un `<h1>` principal por página).
- `<p>`: Párrafos.
- `<strong>` / `<b>`: Texto en negrita (strong tiene importancia semántica).
- `<em>` / `<i>`: Texto en cursiva (em tiene énfasis semántico).
- `<u>`: Texto subrayado.
- `<del>` o `<s>`: Texto tachado.
- `<code>`: Muestra código o comandos de programación.
- `<blockquote>`: Citas de texto en bloque.
- `<hr>`: Línea divisoria temática.
- `<br>`: Salto de línea forzado.

---

## 📌 4. ENLACES E IMÁGENES (RUTAS RELATIVAS)
- `<a href="ruta_relativa.html" target="_blank">`: Enlace (`target="_blank"` abre en nueva pestaña).
- `<img src="img/foto.jpg" alt="descripción" width="500">`: Imagen (`alt` es obligatorio).

---

## 📌 5. MULTIMEDIA
- `<video src="video/video.mp4" controls width="400"></video>`: Video local.
  - Atributos booleanos: `controls`, `autoplay`, `loop`, `muted`.
- `<audio src="audio/sonido.mp3" controls></audio>`: Audio local.
- `<iframe src="https://www.youtube.com/embed/..." frameborder="0" allowfullscreen></iframe>`: Video embebido de YouTube.

---

## 📌 6. LISTAS
- **Desordenadas:** `<ul>` con `<li>`. Atributo `type="disc"` (defecto), `type="circle"`, `type="square"`.
- **Ordenadas:** `<ol>` con `<li>`. Atributo `type="1"` (números), `type="A"` (letras mayúsculas), `type="a"` (minúsculas), `type="I"` (romanos mayúsculas), `type="i"` (romanos minúsculas).
- **Definiciones:** `<dl>` (lista), `<dt>` (término a definir), `<dd>` (descripción o definición).

---

## 📌 7. TABLAS
- `<table>`: Contenedor de la tabla (usar `border="1"` en HTML puro).
- `<caption>`: Título de la tabla.
- `<thead>`: Encabezado (`<tr>` y `<th>`).
- `<tbody>`: Cuerpo de datos (`<tr>` y `<td>`).
- `<tfoot>`: Pie de totales o resumen.
- **Fusión de celdas:**
  - `colspan="N"`: Fusiona N columnas adyacentes horizontalmente.
  - `rowspan="N"`: Fusiona N filas consecutivas verticalmente.

---

## 📌 8. FORMULARIOS Y VALIDACIONES
- `<form action="#" method="POST">`
- `<fieldset>` y `<legend>`: Agrupación visual y título de sección del formulario.
- `<label for="id_control">`: Vinculado al `id` del input.
- Tipos de `<input>`: `text`, `email`, `tel`, `password`, `date`, `number`, `url`, `search`, `color`, `radio`, `checkbox`, `submit`, `reset`.
- `<select>` y `<option>`: Lista desplegable.
- `<textarea rows="4" cols="50">`: Texto multilínea.
- **Atributos de Validación:**
  - `required`: Campo obligatorio.
  - `placeholder="ayuda"`: Texto sugerido.
  - `pattern="[0-9]{10}"`: Expresión regular para validar formato.
  - `min` / `max`: Rangos mínimos y máximos para números o fechas.
  - `maxlength="50"`: Longitud máxima de caracteres.
  - `autocomplete="off"`: Desactiva autocompletado.

---

## 📦 9. MEDIOS Y RUTAS — REPOSITORIO SIN APIS (CESDE OFFLINE)
**Problema:** `video/video_intro.mp4` (5.9 MB) y `audio/audio_intro.mp3` (68k) están en el repo pero GitHub no siempre los baja si hay filtro. Si en la sala ves `404`, re-descárgalos aquí con `yt-dlp` (ya tienes el repo, el contexto y el taller, solo faltan los medias):

```bash
# Video base (reemplaza URL si cambias fuente)
yt-dlp -f "bestvideo[vcodec^=avc1][height<=720]+bestaudio[acodec^=mp4a]/mp4" --recode-video mp4 --postprocessor-args "ffmpeg:-pix_fmt yuv420p" -o "video/video_intro.mp4" "https://www.youtube.com/watch?v=QH2-TGUlwu4"

# Audio base (si necesitas re-generar)
yt-dlp -x --audio-format mp3 -o "audio/audio_intro.mp3" "https://www.youtube.com/watch?v=QH2-TGUlwu4"

# Imágenes: ya están en images/ (lenguaje_programacion.png, portada_banner.jpg) — si falta alguna:
# curl -L -o "images/lenguaje_programacion.png" "https://concepto.de/wp-content/uploads/2018/02/lenguaje-de-programacion-1-e1551218672280-800x400.jpg"
```

**Rutas relativas usadas en el taller:**
- `images/lenguaje_programacion.png` (portada Index)
- `images/portada_banner.jpg`
- `video/video_intro.mp4`
- `audio/audio_intro.mp3`

Si todo está en verde tras `git clone`, no necesitas descargar nada.

---

## ✅ 10. QA ANTI-BASURA (ANTES DE ENTREGAR)
```bash
python scripts/qa_masterclass_gate.py --guion data/cesde/masterclasses/Masterclass_HTML_Taller_Defensa_30min.md --html-dir cesde/05_Capa_Visual_HTML_CSS/taller_completo_html --strict
# Debe decir PASS (2000+ palabras + 3 ejemplos + 2 pausas + media OK)
```
