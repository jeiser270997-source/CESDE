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
FinAlgoritmo
