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
FinAlgoritmo
