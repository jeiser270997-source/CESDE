Algoritmo Ejercicio_15
	kv_energia = 0
	valor_kv = 0
	m3_agua = 0
	valor_m3 = 0
	impulsos_tel = 0
	valor_impulso = 0
	pago_mes_anterior = 0
	total_actual = 0
	diferencia = 0

	Escribir "Ingrese la cantidad de KV de energia"
	Leer kv_energia
	Escribir "Ingrese el valor por KV"
	Leer valor_kv
	Escribir "Ingrese los M3 de agua"
	Leer m3_agua
	Escribir "Ingrese el valor por M3"
	Leer valor_m3
	Escribir "Ingrese la cantidad de impulsos telefonicos"
	Leer impulsos_tel
	Escribir "Ingrese el valor por impulso"
	Leer valor_impulso
	Escribir "Ingrese el valor total pagado en la factura del mes anterior"
	Leer pago_mes_anterior

	//PROCESO
	total_actual = (kv_energia * valor_kv) + (m3_agua * valor_m3) + (impulsos_tel * valor_impulso)
	diferencia = total_actual - pago_mes_anterior

	//DATOS DE SALIDA
	Escribir "Total a pagar factura actual: ", total_actual
	Escribir "Diferencia con el mes anterior: ", diferencia
FinAlgoritmo
