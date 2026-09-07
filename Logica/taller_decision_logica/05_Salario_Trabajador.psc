Algoritmo Salario_Trabajador
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	nombre = ""
	tipo_trabajador = 0
	tipo_texto = ""
	horas_trabajadas = 0
	valor_hora = 0.0
	bonificaciones = 0.0
	deducciones = 0.0
	salario_bruto = 0.0
	salario_neto = 0.0

	// DATOS DE ENTRADA
	Escribir "Ingrese el nombre del trabajador:"
	Leer nombre

	Escribir "Seleccione el tipo de vinculación (1: FIJO, 2: TEMPORAL):"
	Leer tipo_trabajador

	Escribir "Ingrese el número de horas trabajadas en el mes:"
	Leer horas_trabajadas

	// PROCESO
	Si (tipo_trabajador = 1) Entonces
		tipo_texto = "FIJO"
		Escribir "Ingrese el valor pactado por hora:"
		Leer valor_hora

		Escribir "Ingrese el total de bonificaciones:"
		Leer bonificaciones

		Escribir "Ingrese el total de deducciones:"
		Leer deducciones

		salario_bruto = horas_trabajadas * valor_hora
		salario_neto = salario_bruto + bonificaciones - deducciones
	Sino
		tipo_texto = "TEMPORAL"
		valor_hora = 6000.0
		bonificaciones = 0.0
		deducciones = 0.0
		salario_bruto = horas_trabajadas * valor_hora
		salario_neto = salario_bruto
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "Trabajador: ", nombre
	Escribir "Tipo de Vinculación: ", tipo_texto
	Escribir "Horas Trabajadas: ", horas_trabajadas
	Escribir "Valor por Hora: $", valor_hora
	Escribir "Salario Bruto: $", salario_bruto
	Escribir "Bonificaciones: $", bonificaciones
	Escribir "Deducciones: $", deducciones
	Escribir "Salario Neto a Pagar: $", salario_neto
	Escribir "=================================================="
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
