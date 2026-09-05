Algoritmo Rendimiento_Academico
	nombreEstudiante = ""
	materiasEnCurso = 0
	materiasPerdidas = 0
	materiasGanadas = 0
	porcentajeGanadas = 0
	porcentajePerdidas = 0
	
	Escribir "Ingrese el nombre del estudiante"
	Leer nombreEstudiante
	Escribir "Ingrese la cantidad total de materias que cursa en el semestre"
	Leer materiasEnCurso
	Escribir "Ingrese la cantidad de materias perdidas"
	Leer materiasPerdidas
	
	//PROCESO
	materiasGanadas = materiasEnCurso - materiasPerdidas
	porcentajeGanadas = (materiasGanadas * 100) / materiasEnCurso
	porcentajePerdidas = (materiasPerdidas * 100) / materiasEnCurso
	
	//DATOS DE SALIDA
	Escribir "Estudiante: ", nombreEstudiante
	Escribir "Materias aprobadas: ", materiasGanadas
	Escribir "Porcentaje de materias ganadas: ", porcentajeGanadas, "%"
	Escribir "Porcentaje de materias perdidas: ", porcentajePerdidas, "%"
	Escribir "Programa realizado por Jeiser Gutierrez"
FinAlgoritmo
