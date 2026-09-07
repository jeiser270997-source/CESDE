# Taller Decisión Lógica — CESDE (Tríada de Evidencias)

**Estudiante:** Jeiser Abraham Gutiérrez Torres  
**Docente:** Ana Liliana Vera Gómez  
**Asignatura:** Lógica de Programación (Sábados 15:00 - 18:00, Aula 406)  
**Estándar Aplicado:** Regla 34 (E-P-S `.txt` + PSeInt `.psc` + Java `.java` en VS Code)

---

## 📋 Resumen del Taller

Este taller contiene la resolución completa y verificada de los 3 ejercicios asignados de **Estructuras de Decisión y Condicionales**:

| Ejercicio | Tema Central | Archivos Generados |
|---|---|---|
| **01** | Mayor de 2 hermanos (no gemelos) y diferencia de edad | `E-P-S_01_Mayor_Hermanos.txt`<br>`01_Mayor_Hermanos.psc`<br>`MayorHermanos.java` |
| **03** | Comparación de recaudación diaria entre 2 buses | `E-P-S_03_Recaudacion_Buses.txt`<br>`03_Recaudacion_Buses.psc`<br>`RecaudacionBuses.java` |
| **05** | Liquidación salarial: Trabajador FIJO vs TEMPORAL | `E-P-S_05_Salario_Trabajador.txt`<br>`05_Salario_Trabajador.psc`<br>`SalarioTrabajador.java` |

---

## 🔍 Detalle y Casos de Prueba Verificados

### Ejercicio 1: Mayor de 2 Hermanos
- **Entrada de prueba:**
  - Hermano 1: `Carlos`, 24 años
  - Hermano 2: `Andrés`, 19 años
- **Resultado esperado:**
  - Hermano mayor: `Carlos` con 24 años
  - Diferencia de edad: `5` años

### Ejercicio 3: Recaudación entre 2 Buses
- **Entrada de prueba:**
  - Bus 1: Placa `TPX-123`, Pasajeros `180`, Pasaje `3.200 COP` -> Recaudo: `576.000 COP`
  - Bus 2: Placa `WMA-456`, Pasajeros `210`, Pasaje `3.000 COP` -> Recaudo: `630.000 COP`
- **Resultado esperado:**
  - Total General Recaudado: `1.206.000 COP`
  - Veredicto: El bus con placa `WMA-456` obtuvo la mayor recaudación (`630.000 COP`).

### Ejercicio 5: Salario Trabajador FIJO vs TEMPORAL
- **Caso A (Trabajador FIJO):**
  - Nombre: `Mauricio`, Tipo: `1` (FIJO), Horas: `160`
  - Valor hora: `12.000 COP`, Bonificaciones: `150.000 COP`, Deducciones: `80.000 COP`
  - Salario Bruto: `1.920.000 COP`
  - Salario Neto: `1.990.000 COP`
- **Caso B (Trabajador TEMPORAL):**
  - Nombre: `Santiago`, Tipo: `2` (TEMPORAL), Horas: `120`
  - Valor hora base fija: `6.000 COP`, Bonificaciones: `0`, Deducciones: `0`
  - Salario Bruto y Neto: `720.000 COP`

---

## ⚙️ Estándar de Código (Regla 34 & Regla 22)

1. **PSeInt (`.psc`):**
   - Variables declaradas e inicializadas al inicio con el operador `=` (prohibido `Definir ... Como` y flechas `<-`).
   - Bloques comentados obligatorios: `// DATOS DE ENTRADA`, `// PROCESO`, `// DATOS DE SALIDA`.
   - Concatenación exclusiva mediante comas (`,`).

2. **Java (`.java`):**
   - Clase pública ejecutable con JDK 21 / Code Runner.
   - Declaración e inicialización estricta de variables en la cabecera de `main`.
   - Concatenación con signo más (`+`).
   - Firma de autoría: `System.out.println("Programa realizado por Jeiser Gutierrez");`.
