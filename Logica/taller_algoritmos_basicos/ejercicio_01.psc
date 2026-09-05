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
FinAlgoritmo
