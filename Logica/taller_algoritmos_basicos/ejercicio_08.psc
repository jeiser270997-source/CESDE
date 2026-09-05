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
FinAlgoritmo
