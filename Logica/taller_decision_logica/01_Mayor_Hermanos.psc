Algoritmo Mayor_Hermanos
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	nombre_hermano1 = ""
	edad_hermano1 = 0
	nombre_hermano2 = ""
	edad_hermano2 = 0
	nombre_mayor = ""
	edad_mayor = 0
	diferencia_edad = 0

	// DATOS DE ENTRADA
	Escribir "Ingrese el nombre del primer hermano:"
	Leer nombre_hermano1

	Escribir "Ingrese la edad del primer hermano:"
	Leer edad_hermano1

	Escribir "Ingrese el nombre del segundo hermano:"
	Leer nombre_hermano2

	Escribir "Ingrese la edad del segundo hermano:"
	Leer edad_hermano2

	// PROCESO
	Si (edad_hermano1 > edad_hermano2) Entonces
		nombre_mayor = nombre_hermano1
		edad_mayor = edad_hermano1
		diferencia_edad = edad_hermano1 - edad_hermano2
	Sino
		nombre_mayor = nombre_hermano2
		edad_mayor = edad_hermano2
		diferencia_edad = edad_hermano2 - edad_hermano1
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "El hermano mayor es: ", nombre_mayor, " con ", edad_mayor, " años."
	Escribir "La diferencia de edad es de: ", diferencia_edad, " años."
	Escribir "=================================================="
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
