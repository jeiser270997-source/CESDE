Algoritmo Promedio_Alumno
	nombre = ""
	promedio = 0
	mensaje = ""

	Escribir "Ingrese el nombre del estudiante:"
	Leer nombre

	Escribir "Ingrese el promedio del estudiante:"
	Leer promedio

	Si (promedio >= 3.0) Entonces
		mensaje = "Aprobó"
	Sino
		Si (promedio >= 2.0) Entonces
			mensaje = "Aplica para proceso de mejoramiento de promedio"
		Sino
			mensaje = "Reprobó"
		FinSi
	FinSi

	Escribir "El estudiante ", nombre, " ", mensaje, " la materia ya que su promedio fue: ", promedio
FinAlgoritmo
