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
FinAlgoritmo
