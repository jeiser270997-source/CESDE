# 📝 Anotaciones de Clase - Introducción a la Programación (HTML5 & CSS)

**Fecha:** 12 de Septiembre de 2026  
**Institución:** CESDE - Nivel 1  
**Profesor:** Ing. Jonathan Felipe Piedrahita Nieto (`ingfelipe244@gmail.com` | Cel: 301 374 4680)  
**Módulo:** Introducción a la Programación  
**Tema:** CSS3: Selectores, Box Model, Combinadores y Multimedia HTML5  
**Repositorio Oficial del Docente:** `https://github.com/ingfelipe244/panaderia.git`  
**Ubicación Local en Portafolio:** `cesde/Introduccion_Programacion/panaderia/`  

---

## 🎨 1. ¿Qué es CSS y Cuál es su Rol?
* **CSS** (*Cascading Style Sheets* - Hojas de Estilo en Cascada) es el lenguaje estándar encargado del **diseño, presentación y maquetación visual** de un documento web.
* **Separación de responsabilidades:**
  * **HTML:** Esqueleto y contenido semántico (*¿Qué hay?*).
  * **CSS:** Estética, color, fuentes y espaciado (*¿Cómo se ve?*).
* **Vinculación externa:**
  ```html
  <link rel="stylesheet" href="estilos.css">
  ```

---

## 📦 2. El Modelo de Caja (Box Model)
Todo elemento en la web es interpretado por el navegador como una caja rectangular compuesta por 4 capas:
1. **Content (Contenido):** Texto, imagen o video.
2. **Padding (Relleno interno):** Espacio transparente entre el contenido y el borde.
3. **Border (Borde):** Línea que enmarca el padding y el contenido.
4. **Margin (Margen externo):** Espacio exterior que separa la caja de otros elementos.

### ⚙️ El Reset Universal
```css
* {
    margin: 0px;
    padding: 0px;
}
```
* **¿Por qué se usa?** Cada navegador (Chrome, Firefox, Edge) aplica márgenes y rellenos por defecto distintos. Este reset unifica la página en cero para que el diseñador tenga control total.

---

## 🎯 3. Tipos de Selectores en CSS

| Selector | Sintaxis | Ejemplo en Clase | ¿Para qué sirve? |
| :--- | :---: | :--- | :--- |
| **Universal** | `*` | `* { margin:0; }` | Aplica a **todos** los elementos del DOM. |
| **Etiqueta** | `elemento` | `p { font-size: 16px; }` | Aplica a todos los elementos del tipo indicado. |
| **Clase** | `.nombre` | `.imagenCl { border: 7px solid blue; }` | Reutilizable en múltiples elementos (`class="imagenCl"`). |
| **Identificador (ID)** | `#nombre` | `#video1 { width: 200px; }` | Estilo único para un solo elemento específico (`id="video1"`). |

---

## 🔀 4. Selectores Combinadores Avanzados (Vistos en Clase)

En la clase se analizó el selector:
```css
#textoProductosCasa > h2 + p + p {
    color: red;
}
```

### 🧠 Desglose Pedagógico:
1. `#textoProductosCasa`: Busca la sección con ese identificador.
2. `>` **(Hijo Directo):** Exige que el `<h2>` sea hijo directo e inmediato de `#textoProductosCasa`.
3. `+` **(Hermano Adyacente):** Busca el elemento que está **inmediatamente después**.
   * `h2 + p` ➔ Selecciona el **primer** párrafo que está pegado justo después del `<h2>`.
   * `h2 + p + p` ➔ Selecciona el **segundo** párrafo consecutivo.
4. **Resultado Visual:** Pinta de rojo **únicamente el segundo párrafo**, dejando el primero en color normal sin necesidad de ponerle una clase manual.

---

## 📐 5. Propiedades de Estilo Visual

### 🔲 Bordes Redondeados (`border-radius`)
```css
#video3 {
    border-radius: 20px;
}
```
Suaviza las esquinas rectangulares de cualquier elemento (videos, imágenes, botones, tarjetas).

### 👥 Sombras de Caja (`box-shadow`)
```css
#video3 {
    box-shadow: 5px 5px 30px 5px #7d6a6a;
}
```
**Estructura de valores:**
1. `5px`: Desplazamiento horizontal (eje X, hacia la derecha).
2. `5px`: Desplazamiento vertical (eje Y, hacia abajo).
3. `30px`: Desenfoque (*blur*, qué tan difusa es la sombra).
4. `5px`: Expansión (*spread*, qué tanto se propaga el tamaño de la sombra).
5. `#7d6a6a`: Color de la sombra en hexadecimal.

---

## 📑 6. Resumen de Componentes HTML5 Utilizados en Panadería
1. `<audio src="audios/audioHome.mp3" controls>`: Reproductor nativo de audio.
2. `<video src="videos/churros.mp4" controls width="300px">`: Reproductor nativo de video.
3. `<iframe src="https://www.youtube.com/embed/...">`: Integración externa de video de YouTube.
4. `<form>`:
   * `input type="text"`, `number`, `email` con atributo `required`.
   * `<select>` y `<option>` para listas desplegables.
   * `input type="checkbox"` para selección múltiple (temas de profundización).
   * `input type="radio" name="pago"`: Selección excluyente única (agrupados por el mismo `name`).
5. Listas:
   * `<ol><li>...</li></ol>`: Lista ordenada (numérica).
   * `<ul><li>...</li></ul>`: Lista no ordenada (viñetas).
