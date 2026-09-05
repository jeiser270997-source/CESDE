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
FinAlgoritmo
