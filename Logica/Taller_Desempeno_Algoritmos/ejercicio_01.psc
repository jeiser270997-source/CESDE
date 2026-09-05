Algoritmo Ejercicio_1
	nombre = ""
	nota1 = 0
	nota2 = 0
	nota3 = 0
	nota_definitiva = 0

	Escribir "Ingrese el nombre del estudiante"
	Leer nombre
	Escribir "Ingrese la nota 1"
	Leer nota1
	Escribir "Ingrese la nota 2"
	Leer nota2
	Escribir "Ingrese la nota 3"
	Leer nota3

	//PROCESO
	nota_definitiva = (nota1 + nota2 + nota3) / 3

	//DATOS DE SALIDA
	Escribir "Estudiante: ", nombre
	Escribir "Nota 1: ", nota1
	Escribir "Nota 2: ", nota2
	Escribir "Nota 3: ", nota3
	Escribir "Nota Definitiva: ", nota_definitiva
FinAlgoritmo