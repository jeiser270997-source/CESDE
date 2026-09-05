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
FinAlgoritmo
