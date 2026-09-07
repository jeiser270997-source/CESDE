Algoritmo Recaudacion_Buses
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	placa_bus1 = ""
	pasajeros_bus1 = 0
	pasaje_bus1 = 0.0
	recaudo_bus1 = 0.0

	placa_bus2 = ""
	pasajeros_bus2 = 0
	pasaje_bus2 = 0.0
	recaudo_bus2 = 0.0

	total_general = 0.0
	mensaje_mayor = ""

	// DATOS DE ENTRADA
	Escribir "Ingrese la placa del primer bus:"
	Leer placa_bus1

	Escribir "Ingrese la cantidad de pasajeros del bus ", placa_bus1, ":"
	Leer pasajeros_bus1

	Escribir "Ingrese el valor del pasaje del bus ", placa_bus1, ":"
	Leer pasaje_bus1

	Escribir "Ingrese la placa del segundo bus:"
	Leer placa_bus2

	Escribir "Ingrese la cantidad de pasajeros del bus ", placa_bus2, ":"
	Leer pasajeros_bus2

	Escribir "Ingrese el valor del pasaje del bus ", placa_bus2, ":"
	Leer pasaje_bus2

	// PROCESO
	recaudo_bus1 = pasajeros_bus1 * pasaje_bus1
	recaudo_bus2 = pasajeros_bus2 * pasaje_bus2
	total_general = recaudo_bus1 + recaudo_bus2

	Si (recaudo_bus1 > recaudo_bus2) Entonces
		mensaje_mayor = "El bus de placa " + placa_bus1 + " obtuvo la mayor recaudación."
	Sino
		Si (recaudo_bus2 > recaudo_bus1) Entonces
			mensaje_mayor = "El bus de placa " + placa_bus2 + " obtuvo la mayor recaudación."
		Sino
			mensaje_mayor = "Ambos buses obtuvieron la misma recaudación."
		FinSi
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "Recaudo Bus 1 (", placa_bus1, "): $", recaudo_bus1
	Escribir "Recaudo Bus 2 (", placa_bus2, "): $", recaudo_bus2
	Escribir "Total General Recaudado: $", total_general
	Escribir "Comparación: ", mensaje_mayor
	Escribir "=================================================="
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
