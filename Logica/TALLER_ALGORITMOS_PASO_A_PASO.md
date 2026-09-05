# GUÍA MAESTRA — TALLER DE ALGORITMOS BÁSICOS (CESDE)
**Estudiante:** Jeiser Gutiérrez  
**Materia:** Lógica de Programación / PSeInt  
**Fecha:** 15-Ago-2026  
**Formato Oficial:** Coma (`,`) en `Escribir` para concatenación en PSeInt.

---

## ÍNDICE DE EJERCICIOS

1. [Ejercicio 1: Ahorro Anual de Salario](#ejercicio-1-ahorro-anual-de-salario)
2. [Ejercicio 2: Recaudo Lavadero de Vehículos](#ejercicio-2-recaudo-lavadero-de-vehículos)
3. [Ejercicio 3: Promedio de Edad de 3 Hermanos](#ejercicio-3-promedio-de-edad-de-3-hermanos)
4. [Ejercicio 4: Área de Triángulo y Círculo](#ejercicio-4-área-de-triángulo-y-círculo)
5. [Ejercicio 5: Salario con Bonificación por Antigüedad y Deducciones](#ejercicio-5-salario-con-bonificación-por-antigüedad-y-deducciones)
6. [Ejercicio 6: Total Producido por Dos Buses](#ejercicio-6-total-producido-por-dos-buses)
7. [Ejercicio 7: Cálculo de Velocidad](#ejercicio-7-cálculo-de-velocidad)
8. [Ejercicio 8: Venta de Artículo e IVA](#ejercicio-8-venta-de-artículo-e-iva)
9. [Ejercicio 9: Liquidación de Matrícula Estudiantil](#ejercicio-9-liquidación-de-matrícula-estudiantil)
10. [Ejercicio 10: Promedio de Edad de Hermanos](#ejercicio-10-promedio-de-edad-de-hermanos)
11. [Ejercicio 11: Préstamo Bancario sobre Disponible (50x)](#ejercicio-11-préstamo-bancario-sobre-disponible-50x)
12. [Ejercicio 12: Préstamo Bancario](#ejercicio-12-préstamo-bancario)
13. [Ejercicio 14: Factura de Servicios Públicos](#ejercicio-14-factura-de-servicios-públicos)
14. [Ejercicio 15: Servicios Públicos con Diferencia Mes Anterior](#ejercicio-15-servicios-públicos-con-diferencia-mes-anterior)
15. [Ejercicio 16: Liquidación de Bus, Combustible y Conductor](#ejercicio-16-liquidación-de-bus-combustible-y-conductor)

---

### EJERCICIO 1: Ahorro Anual de Salario

**Enunciado:**  
Elaborar un algoritmo que muestre al usuario el dinero que puede ahorrar en un año. El usuario ingresará su salario mensual, el monto de los ingresos extras mensuales y el valor de los gastos mensuales.

**Paso 1: Datos de Entrada**
- `salario_mensual = 0`
- `extras_mensual = 0`
- `gastos_mensuales = 0`

**Paso 2: Proceso**
- `suma_salario = (salario_mensual + extras_mensual) - gastos_mensuales`
- `ahorro_mes = suma_salario * 0.1` (10% de ahorro)
- `anual = ahorro_mes * 12`

**Paso 3: Datos de Salida**
- `ahorro_mes`
- `anual`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_1
	salario_mensual = 0
	extras_mensual = 0
	gastos_mensuales = 0
	suma_salario = 0
	ahorro_mes = 0
	anual = 0

	Escribir "Digite el valor de su salario mensual"
	Leer salario_mensual
	Escribir "Ingrese el valor de los Ingresos Extra"
	Leer extras_mensual
	Escribir "Ingrese el Valor de tus gastos mensuales"
	Leer gastos_mensuales

	//PROCESO
	suma_salario = (salario_mensual + extras_mensual) - gastos_mensuales
	ahorro_mes = suma_salario * 0.1
	anual = ahorro_mes * 12

	//DATOS DE SALIDA
	Escribir "El total devengado mes: ", suma_salario
	Escribir "Ahorro mensual del 10%: ", ahorro_mes
	Escribir "Posible ahorro anual: ", anual
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 2: Recaudo Lavadero de Vehículos

**Enunciado:**  
En un lavadero de vehículos se relacionan al final del día la cantidad de taxis que se lavaron, la cantidad de buses, la cantidad de particulares y la cantidad de motos. Se desea un programa que muestre el dinero recaudado por cada tipo de vehículo (taxis $3.000, buses $10.000, particulares $5.000 y motos $2.000) y el total realizado en el lavadero.

**Paso 1: Datos de Entrada**
- `cant_taxis = 0`
- `cant_buses = 0`
- `cant_particulares = 0`
- `cant_motos = 0`

**Paso 2: Proceso**
- `rec_taxis = cant_taxis * 3000`
- `rec_buses = cant_buses * 10000`
- `rec_particulares = cant_particulares * 5000`
- `rec_motos = cant_motos * 2000`
- `total_lavadero = rec_taxis + rec_buses + rec_particulares + rec_motos`

**Paso 3: Datos de Salida**
- `rec_taxis`, `rec_buses`, `rec_particulares`, `rec_motos`, `total_lavadero`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_2
	cant_taxis = 0
	cant_buses = 0
	cant_particulares = 0
	cant_motos = 0
	rec_taxis = 0
	rec_buses = 0
	rec_particulares = 0
	rec_motos = 0
	total_lavadero = 0

	Escribir "Ingrese la cantidad de taxis lavados"
	Leer cant_taxis
	Escribir "Ingrese la cantidad de buses lavados"
	Leer cant_buses
	Escribir "Ingrese la cantidad de particulares lavados"
	Leer cant_particulares
	Escribir "Ingrese la cantidad de motos lavadas"
	Leer cant_motos

	//PROCESO
	rec_taxis = cant_taxis * 3000
	rec_buses = cant_buses * 10000
	rec_particulares = cant_particulares * 5000
	rec_motos = cant_motos * 2000
	total_lavadero = rec_taxis + rec_buses + rec_particulares + rec_motos

	//DATOS DE SALIDA
	Escribir "Recaudado en Taxis: ", rec_taxis
	Escribir "Recaudado en Buses: ", rec_buses
	Escribir "Recaudado en Particulares: ", rec_particulares
	Escribir "Recaudado en Motos: ", rec_motos
	Escribir "Total recaudado en el lavadero: ", total_lavadero
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 3: Promedio de Edad de 3 Hermanos

**Enunciado:**  
Elaborar un algoritmo que le permita al usuario ingresar los nombres y las edades de 3 hermanos y el computador le muestre los 3 nombres y el promedio de edad de ellos.

**Paso 1: Datos de Entrada**
- `nom1 = ""` , `edad1 = 0`
- `nom2 = ""` , `edad2 = 0`
- `nom3 = ""` , `edad3 = 0`

**Paso 2: Proceso**
- `promedio_edad = (edad1 + edad2 + edad3) / 3`

**Paso 3: Datos de Salida**
- `nom1`, `nom2`, `nom3`, `promedio_edad`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_3
	nom1 = ""
	edad1 = 0
	nom2 = ""
	edad2 = 0
	nom3 = ""
	edad3 = 0
	promedio_edad = 0

	Escribir "Ingrese el nombre del primer hermano"
	Leer nom1
	Escribir "Ingrese la edad del primer hermano"
	Leer edad1
	Escribir "Ingrese el nombre del segundo hermano"
	Leer nom2
	Escribir "Ingrese la edad del segundo hermano"
	Leer edad2
	Escribir "Ingrese el nombre del tercer hermano"
	Leer nom3
	Escribir "Ingrese la edad del tercer hermano"
	Leer edad3

	//PROCESO
	promedio_edad = (edad1 + edad2 + edad3) / 3

	//DATOS DE SALIDA
	Escribir "Hermanos procesados: ", nom1, ", ", nom2, ", ", nom3
	Escribir "El promedio de edad de los 3 hermanos es: ", promedio_edad
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 4: Área de Triángulo y Círculo

**Enunciado:**  
Elaborar un algoritmo que le permita al usuario ingresar la altura y la base de un triángulo y el radio de un círculo y le muestre en la pantalla el área de estas dos figuras.

**Paso 1: Datos de Entrada**
- `base_triangulo = 0`
- `altura_triangulo = 0`
- `radio_circulo = 0`

**Paso 2: Proceso**
- `area_triangulo = (base_triangulo * altura_triangulo) / 2`
- `area_circulo = 3.1416 * (radio_circulo * radio_circulo)`

**Paso 3: Datos de Salida**
- `area_triangulo`
- `area_circulo`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_4
	base_triangulo = 0
	altura_triangulo = 0
	radio_circulo = 0
	area_triangulo = 0
	area_circulo = 0

	Escribir "Ingrese la base del triangulo"
	Leer base_triangulo
	Escribir "Ingrese la altura del triangulo"
	Leer altura_triangulo
	Escribir "Ingrese el radio del circulo"
	Leer radio_circulo

	//PROCESO
	area_triangulo = (base_triangulo * altura_triangulo) / 2
	area_circulo = 3.1416 * (radio_circulo * radio_circulo)

	//DATOS DE SALIDA
	Escribir "El area del triangulo es: ", area_triangulo
	Escribir "El area del circulo es: ", area_circulo
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 5: Salario con Bonificación por Antigüedad y Deducciones

**Enunciado:**  
Crear un algoritmo que le pida al usuario los datos de un trabajador así: El número de horas trabajadas en el mes, el salario básico hora, la cantidad de años que tiene de laborar en la empresa y el valor que le deducen mensualmente. El algoritmo le debe mostrar: El salario bruto, el valor de la bonificación ($30.000 por cada año laborado), el valor de las deducciones y el salario neto.

**Paso 1: Datos de Entrada**
- `horas_mes = 0`
- `salario_hora = 0`
- `anios_laborados = 0`
- `deducciones = 0`

**Paso 2: Proceso**
- `salario_bruto = horas_mes * salario_hora`
- `bonificacion = anios_laborados * 30000`
- `salario_neto = salario_bruto + bonificacion - deducciones`

**Paso 3: Datos de Salida**
- `salario_bruto`, `bonificacion`, `deducciones`, `salario_neto`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_5
	horas_mes = 0
	salario_hora = 0
	anios_laborados = 0
	deducciones = 0
	salario_bruto = 0
	bonificacion = 0
	salario_neto = 0

	Escribir "Ingrese el numero de horas trabajadas en el mes"
	Leer horas_mes
	Escribir "Ingrese el valor del salario basico por hora"
	Leer salario_hora
	Escribir "Ingrese la cantidad de años laborados"
	Leer anios_laborados
	Escribir "Ingrese el valor total de deducciones mensuales"
	Leer deducciones

	//PROCESO
	salario_bruto = horas_mes * salario_hora
	bonificacion = anios_laborados * 30000
	salario_neto = salario_bruto + bonificacion - deducciones

	//DATOS DE SALIDA
	Escribir "El salario bruto es: ", salario_bruto
	Escribir "El valor de la bonificacion es: ", bonificacion
	Escribir "El valor de las deducciones es: ", deducciones
	Escribir "El salario neto a pagar es: ", salario_neto
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 6: Total Producido por Dos Buses

**Enunciado:**  
Una persona posee dos buses, al final del día desea conocer el producido por cada bus y el total. Por cada bus se digita el número de pasajeros transportados y el valor del pasaje.

**Paso 1: Datos de Entrada**
- `pasajeros_bus1 = 0`, `pasaje_bus1 = 0`
- `pasajeros_bus2 = 0`, `pasaje_bus2 = 0`

**Paso 2: Proceso**
- `producido_bus1 = pasajeros_bus1 * pasaje_bus1`
- `producido_bus2 = pasajeros_bus2 * pasaje_bus2`
- `total_producido = producido_bus1 + producido_bus2`

**Paso 3: Datos de Salida**
- `producido_bus1`, `producido_bus2`, `total_producido`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_6
	pasajeros_bus1 = 0
	pasaje_bus1 = 0
	pasajeros_bus2 = 0
	pasaje_bus2 = 0
	producido_bus1 = 0
	producido_bus2 = 0
	total_producido = 0

	Escribir "Ingrese los pasajeros transportados por el Bus 1"
	Leer pasajeros_bus1
	Escribir "Ingrese el valor del pasaje del Bus 1"
	Leer pasaje_bus1
	Escribir "Ingrese los pasajeros transportados por el Bus 2"
	Leer pasajeros_bus2
	Escribir "Ingrese el valor del pasaje del Bus 2"
	Leer pasaje_bus2

	//PROCESO
	producido_bus1 = pasajeros_bus1 * pasaje_bus1
	producido_bus2 = pasajeros_bus2 * pasaje_bus2
	total_producido = producido_bus1 + producido_bus2

	//DATOS DE SALIDA
	Escribir "Producido por el Bus 1: ", producido_bus1
	Escribir "Producido por el Bus 2: ", producido_bus2
	Escribir "Total producido por los dos buses: ", total_producido
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 7: Cálculo de Velocidad

**Enunciado:**  
Elaborar un algoritmo que le permita al usuario ingresar la distancia recorrida por un vehículo y el tiempo que se demora en recorrerlo y el computador le muestre la velocidad con que la recorrió.

**Paso 1: Datos de Entrada**
- `distancia = 0`
- `tiempo = 0`

**Paso 2: Proceso**
- `velocidad = distancia / tiempo`

**Paso 3: Datos de Salida**
- `velocidad`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_7
	distancia = 0
	tiempo = 0
	velocidad = 0

	Escribir "Ingrese la distancia recorrida (ej. km o metros)"
	Leer distancia
	Escribir "Ingrese el tiempo empleado (ej. horas o segundos)"
	Leer tiempo

	//PROCESO
	velocidad = distancia / tiempo

	//DATOS DE SALIDA
	Escribir "La velocidad calculada del vehiculo es: ", velocidad
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 8: Venta de Artículo e IVA

**Enunciado:**  
Crear un algoritmo donde el usuario pueda ingresar la cantidad de unidades vendidas de un artículo, el valor unitario de ese artículo y el porcentaje de IVA, y el computador le muestre: el valor bruto de la venta, el valor que debe pagar por IVA y el valor neto de la venta.

**Paso 1: Datos de Entrada**
- `CANT_UNIDADES = 0`
- `VALOR_UNITARIO = 0`
- `PORCENTAJE_IVA = 0`

**Paso 2: Proceso**
- `VALOR_BRUTO = CANT_UNIDADES * VALOR_UNITARIO`
- `VALOR_IVA = VALOR_BRUTO * (PORCENTAJE_IVA / 100)`
- `VALOR_NETO = VALOR_BRUTO + VALOR_IVA`

**Paso 3: Datos de Salida**
- `VALOR_BRUTO`, `VALOR_IVA`, `VALOR_NETO`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_8
	CANT_UNIDADES = 0
	VALOR_UNITARIO = 0
	PORCENTAJE_IVA = 0
	VALOR_BRUTO = 0
	VALOR_IVA = 0
	VALOR_NETO = 0

	Escribir "Ingrese la cantidad de unidades vendidas"
	Leer CANT_UNIDADES
	Escribir "Ingrese el valor unitario del articulo"
	Leer VALOR_UNITARIO
	Escribir "Ingrese el porcentaje de IVA"
	Leer PORCENTAJE_IVA

	//PROCESO
	VALOR_BRUTO = CANT_UNIDADES * VALOR_UNITARIO
	VALOR_IVA = VALOR_BRUTO * (PORCENTAJE_IVA / 100)
	VALOR_NETO = VALOR_BRUTO + VALOR_IVA

	//DATOS DE SALIDA
	Escribir "El valor bruto de la venta es: ", VALOR_BRUTO
	Escribir "El valor pagado por IVA es: ", VALOR_IVA
	Escribir "El valor neto de la venta es: ", VALOR_NETO
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 9: Liquidación de Matrícula Estudiantil

**Enunciado:**  
Crear un algoritmo que le permita al usuario ingresar el nombre de un estudiante, la cantidad de materias que matriculó y el valor de cada materia y el computador le imprima el valor neto de la matrícula sabiendo que al valor de las materias se le debe sumar la papelería que tiene un costo fijo de $20.000 y el carné un valor de $8.000. El estudiante tiene un descuento del 20% sobre el costo de las materias.

**Paso 1: Datos de Entrada**
- `nom_estudiante = ""`
- `cant_materias = 0`
- `valor_materia = 0`

**Paso 2: Proceso**
- `costo_materias = cant_materias * valor_materia`
- `descuento = costo_materias * 0.20`
- `subtotal_materias = costo_materias - descuento`
- `neto_matricula = subtotal_materias + 20000 + 8000`

**Paso 3: Datos de Salida**
- `neto_matricula` (y detalle de materias/descuento)

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_9
	nom_estudiante = ""
	cant_materias = 0
	valor_materia = 0
	costo_materias = 0
	descuento = 0
	subtotal_materias = 0
	neto_matricula = 0

	Escribir "Ingrese el nombre del estudiante"
	Leer nom_estudiante
	Escribir "Ingrese la cantidad de materias matriculadas"
	Leer cant_materias
	Escribir "Ingrese el valor de cada materia"
	Leer valor_materia

	//PROCESO
	costo_materias = cant_materias * valor_materia
	descuento = costo_materias * 0.20
	subtotal_materias = costo_materias - descuento
	neto_matricula = subtotal_materias + 20000 + 8000

	//DATOS DE SALIDA
	Escribir "Estudiante: ", nom_estudiante
	Escribir "Costo bruto de materias: ", costo_materias
	Escribir "Descuento del 20% sobre materias: ", descuento
	Escribir "Valor neto final de la matricula: ", neto_matricula
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 10: Promedio de Edad de Hermanos

**Enunciado:**  
Elaborar un algoritmo que le permita al usuario ingresar los nombres y las edades de 3 hermanos y el computador le muestre los 3 nombres y el promedio de edad de ellos.

**Paso 1: Datos de Entrada**
- `nom1 = ""` , `edad1 = 0`
- `nom2 = ""` , `edad2 = 0`
- `nom3 = ""` , `edad3 = 0`

**Paso 2: Proceso**
- `promedio_edad = (edad1 + edad2 + edad3) / 3`

**Paso 3: Datos de Salida**
- `nom1`, `nom2`, `nom3`, `promedio_edad`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_10
	nom1 = ""
	edad1 = 0
	nom2 = ""
	edad2 = 0
	nom3 = ""
	edad3 = 0
	promedio_edad = 0

	Escribir "Ingrese el nombre del primer hermano"
	Leer nom1
	Escribir "Ingrese la edad del primer hermano"
	Leer edad1
	Escribir "Ingrese el nombre del segundo hermano"
	Leer nom2
	Escribir "Ingrese la edad del segundo hermano"
	Leer edad2
	Escribir "Ingrese el nombre del tercer hermano"
	Leer nom3
	Escribir "Ingrese la edad del tercer hermano"
	Leer edad3

	//PROCESO
	promedio_edad = (edad1 + edad2 + edad3) / 3

	//DATOS DE SALIDA
	Escribir "Nombres: ", nom1, ", ", nom2, ", ", nom3
	Escribir "El promedio de edad es: ", promedio_edad
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 11: Préstamo Bancario sobre Disponible (50x)

**Enunciado:**  
Elaborar un algoritmo que calcule el valor que le puede prestar un banco a una persona, sabiendo que el monto del préstamo es 50 veces el dinero disponible que tiene. El dinero disponible es igual al salario mensual más los ingresos adicionales menos los gastos. Se debe mostrar el dinero disponible y el monto del préstamo.

**Paso 1: Datos de Entrada**
- `salario_mensual = 0`
- `ingresos_adicionales = 0`
- `gastos = 0`

**Paso 2: Proceso**
- `dinero_disponible = (salario_mensual + ingresos_adicionales) - gastos`
- `monto_prestamo = dinero_disponible * 50`

**Paso 3: Datos de Salida**
- `dinero_disponible`
- `monto_prestamo`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_11
	salario_mensual = 0
	ingresos_adicionales = 0
	gastos = 0
	dinero_disponible = 0
	monto_prestamo = 0

	Escribir "Ingrese el salario mensual"
	Leer salario_mensual
	Escribir "Ingrese los ingresos adicionales mensuales"
	Leer ingresos_adicionales
	Escribir "Ingrese los gastos mensuales"
	Leer gastos

	//PROCESO
	dinero_disponible = (salario_mensual + ingresos_adicionales) - gastos
	monto_prestamo = dinero_disponible * 50

	//DATOS DE SALIDA
	Escribir "Dinero disponible mensual: ", dinero_disponible
	Escribir "Monto maximo de prestamo bancario (50 veces): ", monto_prestamo
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 12: Préstamo Bancario

**Enunciado:**  
Elaborar un algoritmo que calcule el valor que le puede prestar un banco a una persona, sabiendo que el monto del préstamo es 50 veces el dinero disponible que tiene. El dinero disponible es igual al salario mensual más los ingresos adicionales menos los gastos. Se debe mostrar el dinero disponible y el monto del préstamo.

**Paso 1: Datos de Entrada**
- `salario_mensual = 0`
- `ingresos_adicionales = 0`
- `gastos = 0`

**Paso 2: Proceso**
- `dinero_disponible = (salario_mensual + ingresos_adicionales) - gastos`
- `monto_prestamo = dinero_disponible * 50`

**Paso 3: Datos de Salida**
- `dinero_disponible`
- `monto_prestamo`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_12
	salario_mensual = 0
	ingresos_adicionales = 0
	gastos = 0
	dinero_disponible = 0
	monto_prestamo = 0

	Escribir "Ingrese su salario mensual"
	Leer salario_mensual
	Escribir "Ingrese sus ingresos adicionales"
	Leer ingresos_adicionales
	Escribir "Ingrese sus gastos mensuales"
	Leer gastos

	//PROCESO
	dinero_disponible = (salario_mensual + ingresos_adicionales) - gastos
	monto_prestamo = dinero_disponible * 50

	//DATOS DE SALIDA
	Escribir "Dinero disponible mensual: ", dinero_disponible
	Escribir "Monto maximo del prestamo: ", monto_prestamo
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 14: Factura de Servicios Públicos

**Enunciado:**  
Elaborar un algoritmo que le permita al usuario ingresar los datos de la factura de servicios públicos y el computador le muestre el total que debe pagar. El usuario ingresará el total de KV de energía y el valor del K, el total de M3 de agua y el valor del M3, el total de impulsos telefónicos y el valor del impulso.

**Paso 1: Datos de Entrada**
- `kv_energia = 0`, `valor_kv = 0`
- `m3_agua = 0`, `valor_m3 = 0`
- `impulsos_tel = 0`, `valor_impulso = 0`

**Paso 2: Proceso**
- `total_energia = kv_energia * valor_kv`
- `total_agua = m3_agua * valor_m3`
- `total_tel = impulsos_tel * valor_impulso`
- `total_servicios = total_energia + total_agua + total_tel`

**Paso 3: Datos de Salida**
- `total_energia`, `total_agua`, `total_tel`, `total_servicios`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_14
	kv_energia = 0
	valor_kv = 0
	m3_agua = 0
	valor_m3 = 0
	impulsos_tel = 0
	valor_impulso = 0
	total_energia = 0
	total_agua = 0
	total_tel = 0
	total_servicios = 0

	Escribir "Ingrese la cantidad de KV de energia consumidos"
	Leer kv_energia
	Escribir "Ingrese el valor por KV de energia"
	Leer valor_kv
	Escribir "Ingrese los M3 de agua consumidos"
	Leer m3_agua
	Escribir "Ingrese el valor por M3 de agua"
	Leer valor_m3
	Escribir "Ingrese la cantidad de impulsos telefonicos"
	Leer impulsos_tel
	Escribir "Ingrese el valor por impulso telefonico"
	Leer valor_impulso

	//PROCESO
	total_energia = kv_energia * valor_kv
	total_agua = m3_agua * valor_m3
	total_tel = impulsos_tel * valor_impulso
	total_servicios = total_energia + total_agua + total_tel

	//DATOS DE SALIDA
	Escribir "Total Energia: ", total_energia
	Escribir "Total Agua: ", total_agua
	Escribir "Total Telefono: ", total_tel
	Escribir "Total a pagar en la factura de servicios: ", total_servicios
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 15: Servicios Públicos con Diferencia Mes Anterior

**Enunciado:**  
Con los mismos datos del ejercicio anterior se pide que además le imprima la diferencia con el mes anterior, sabiendo que el usuario ingresa también el total que pagó por todos los servicios en el mes anterior.

**Paso 1: Datos de Entrada**
- `kv_energia = 0`, `valor_kv = 0`
- `m3_agua = 0`, `valor_m3 = 0`
- `impulsos_tel = 0`, `valor_impulso = 0`
- `pago_mes_anterior = 0`

**Paso 2: Proceso**
- `total_actual = (kv_energia * valor_kv) + (m3_agua * valor_m3) + (impulsos_tel * valor_impulso)`
- `diferencia = total_actual - pago_mes_anterior`

**Paso 3: Datos de Salida**
- `total_actual`
- `diferencia`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_15
	kv_energia = 0
	valor_kv = 0
	m3_agua = 0
	valor_m3 = 0
	impulsos_tel = 0
	valor_impulso = 0
	pago_mes_anterior = 0
	total_actual = 0
	diferencia = 0

	Escribir "Ingrese la cantidad de KV de energia"
	Leer kv_energia
	Escribir "Ingrese el valor por KV"
	Leer valor_kv
	Escribir "Ingrese los M3 de agua"
	Leer m3_agua
	Escribir "Ingrese el valor por M3"
	Leer valor_m3
	Escribir "Ingrese la cantidad de impulsos telefonicos"
	Leer impulsos_tel
	Escribir "Ingrese el valor por impulso"
	Leer valor_impulso
	Escribir "Ingrese el valor total pagado en la factura del mes anterior"
	Leer pago_mes_anterior

	//PROCESO
	total_actual = (kv_energia * valor_kv) + (m3_agua * valor_m3) + (impulsos_tel * valor_impulso)
	diferencia = total_actual - pago_mes_anterior

	//DATOS DE SALIDA
	Escribir "Total a pagar factura actual: ", total_actual
	Escribir "Diferencia con el mes anterior: ", diferencia
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```

---

### EJERCICIO 16: Liquidación de Bus, Combustible y Conductor

**Enunciado:**  
Escriba un algoritmo que le permita al propietario de un bus ingresar el número de pasajeros transportados en un día, el valor del pasaje y el valor pagado por combustible. El programa le debe mostrar el total producido por el bus, el valor pagado al conductor (que es el 10% del total producido) y la ganancia neta (producido menos los gastos).

**Paso 1: Datos de Entrada**
- `CANT_PASAJEROS = 0`
- `COSTO_PASAJE = 0`
- `COSTO_GASOLINA = 0`

**Paso 2: Proceso**
- `INGRESOS_BRUTOS = CANT_PASAJEROS * COSTO_PASAJE`
- `SUELDO_CONDUCTOR = INGRESOS_BRUTOS * 0.1`
- `INGRESOS_NETOS = INGRESOS_BRUTOS - COSTO_GASOLINA - SUELDO_CONDUCTOR`

**Paso 3: Datos de Salida**
- `INGRESOS_BRUTOS`, `SUELDO_CONDUCTOR`, `INGRESOS_NETOS`

**Paso 4: Código PSeInt**
```text
Algoritmo Ejercicio_16
	CANT_PASAJEROS = 0
	COSTO_PASAJE = 0
	COSTO_GASOLINA = 0
	INGRESOS_BRUTOS = 0
	SUELDO_CONDUCTOR = 0
	INGRESOS_NETOS = 0

	Escribir "Cantidad de pasajeros transportados en el dia"
	Leer CANT_PASAJEROS
	Escribir "Cuanto vale el pasaje?"
	Leer COSTO_PASAJE
	Escribir "Gasto realizado en Combustible en el dia"
	Leer COSTO_GASOLINA

	//PROCESO
	INGRESOS_BRUTOS = CANT_PASAJEROS * COSTO_PASAJE
	SUELDO_CONDUCTOR = INGRESOS_BRUTOS * 0.1
	INGRESOS_NETOS = INGRESOS_BRUTOS - COSTO_GASOLINA - SUELDO_CONDUCTOR

	//DATOS DE SALIDA
	Escribir " El Ingreso Bruto del Bus por dia es: ", INGRESOS_BRUTOS
	Escribir " El Salario del dia del Conductor fue de: ", SUELDO_CONDUCTOR
	Escribir " El Neto Producido del Bus fue: ", INGRESOS_NETOS
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
```
