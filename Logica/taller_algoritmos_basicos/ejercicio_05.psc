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
FinAlgoritmo
