Algoritmo Ejercicio_3
	nom1 = ""
	edad1 = 0
	nom2 = ""
	edad2 = 0
	nom3 = ""
	edad3 = 0
	promedio_edad = 0

	Escribir "Ingrese el nombre del primer hermano"
	Leer nom1
	Escribir "Ingrese la edad del primer hermano"
	Leer edad1
	Escribir "Ingrese el nombre del segundo hermano"
	Leer nom2
	Escribir "Ingrese la edad del segundo hermano"
	Leer edad2
	Escribir "Ingrese el nombre del tercer hermano"
	Leer nom3
	Escribir "Ingrese la edad del tercer hermano"
	Leer edad3

	//PROCESO
	promedio_edad = (edad1 + edad2 + edad3) / 3

	//DATOS DE SALIDA
	Escribir "Hermanos procesados: ", nom1, ", ", nom2, ", ", nom3
	Escribir "El promedio de edad de los 3 hermanos es: ", promedio_edad
FinAlgoritmo
