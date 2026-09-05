# NOTAS CLASE CESDE — 15-AGO-2026 (INTRODUCCIÓN A LA PROGRAMACIÓN)

[TEMA] HTML5 Multimedia (video, img) + Tablas / Maquetación básica.

[ESTRUCTURA_CORRECTA]
1. `<header>` contiene banner (`<img>`) y barra de navegación (`<nav>`).
2. `<main>` va AFUERA del `<header>` (hermano directo en `<body>`). NUNCA `<main>` dentro de `<header>`.
3. `<video>` requiere atributo `controls` (o `<source>`) para que el usuario pueda reproducir/pausar.
4. `<table>` en maquetación introductoria: usado en clase para alinear imagen y video por filas (`<tr>`) y columnas (`<td>`).
5. `<footer>` al final de `<body>` para pie de página.

[EJEMPLO_CORRECTO]
```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Panadería</title>
</head>
<body>
  <!-- 1. Encabezado con banner y navegación -->
  <header>
    <img src="imagen/banner.png" alt="Banner de la Panadería">
    <nav>
      <a>Inicio</a>
      <a>Contacto</a>
      <a>Productos</a>
      <a>Sobre Nosotros</a>
    </nav>
  </header>

  <!-- 2. Contenido Principal -->
  <main>
    <section>
      <table>
        <tr>
          <td>
            <img src="imagen/producto.jpg" alt="Pan Artesanal">
          </td>
        </tr>
        <tr>
          <td>
            <video src="video/preparacion.mp4" controls width="400"></video>
          </td>
        </tr>
      </table>
    </section>
  </main>
</body>
</html>
```
