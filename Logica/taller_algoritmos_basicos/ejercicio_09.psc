Algoritmo Ejercicio_9
	nom_estudiante = ""
	cant_materias = 0
	valor_materia = 0
	costo_materias = 0
	descuento = 0
	subtotal_materias = 0
	neto_matricula = 0

	Escribir "Ingrese el nombre del estudiante"
	Leer nom_estudiante
	Escribir "Ingrese la cantidad de materias matriculadas"
	Leer cant_materias
	Escribir "Ingrese el valor de cada materia"
	Leer valor_materia

	//PROCESO
	costo_materias = cant_materias * valor_materia
	descuento = costo_materias * 0.20
	subtotal_materias = costo_materias - descuento
	neto_matricula = subtotal_materias + 20000 + 8000

	//DATOS DE SALIDA
	Escribir "Estudiante: ", nom_estudiante
	Escribir "Costo bruto de materias: ", costo_materias
	Escribir "Descuento del 20% sobre materias: ", descuento
	Escribir "Valor neto final de la matricula: ", neto_matricula
FinAlgoritmo
