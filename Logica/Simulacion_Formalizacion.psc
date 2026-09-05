Algoritmo Simulacion_Formalizacion_MiPrimeraEmpresa
	// ============================================================================
	// PROYECTO INTEGRADOR CESDE - NIVEL 1
	// Módulo: Lógica de Programación
	// Descripción: Simulación secuencial de cálculo de costos de formalización 
	//              y facturación para una microempresa en Colombia.
	// ============================================================================
	
	// --- DECLARACIÓN DE VARIABLES ---
	Definir razonSocial, nitRut Como Cadena
	Definir capitalInicial, tarifaCamara, costoRut, impuestoIcaEstimado, costoTotalFormalizacion Como Real
	Definir subtotalVenta, valorIva, totalFactura Como Real
	Definir esResponsableIva Como Entero
	
	Escribir "============================================================"
	Escribir "     SISTEMA MIPRIMERAEMPRESA - FORMALIZACIÓN & FACTURACIÓN"
	Escribir "============================================================"
	
	// --- PASO 1: CAPTURA DE DATOS DE LA MICROEMPRESA ---
	Escribir "Ingrese la Razón Social o Nombre Comercial:"
	Leer razonSocial
	Escribir "Ingrese el NIT o Cédula del Representante:"
	Leer nitRut
	Escribir "Ingrese el Capital Inicial de Trabajo ($ COP):"
	Leer capitalInicial
	
	// --- PASO 2: CÁLCULO DE COSTOS DE FORMALIZACIÓN (ESTRUCTURA SECUENCIAL) ---
	// Tarifa base Cámara de Comercio aproximada (0.7% del capital de trabajo)
	tarifaCamara <- capitalInicial * 0.007
	Si tarifaCamara < 55000 Entonces
		tarifaCamara <- 55000 // Tarifa mínima estipulada
	Fin Si
	
	costoRut <- 0 // Inscripción en RUT DIAN es gratuita por ley
	impuestoIcaEstimado <- capitalInicial * 0.004 // 4 por mil estimado Industria y Comercio
	costoTotalFormalizacion <- tarifaCamara + costoRut + impuestoIcaEstimado
	
	Escribir ""
	Escribir "------------------------------------------------------------"
	Escribir "   RESUMEN DE ESTIMACIÓN DE FORMALIZACIÓN PARA: ", Mayusculas(razonSocial)
	Escribir "------------------------------------------------------------"
	Escribir " NIT / Documento: ", nitRut
	Escribir " Capital Registrado: $", capitalInicial
	Escribir " Tarifa Cámara Comercio Est.: $", tarifaCamara
	Escribir " Tramite RUT DIAN: $", costoRut, " (Gratuito)"
	Escribir " Proyección Impuesto ICA (Anual): $", impuestoIcaEstimado
	Escribir " COSTO TOTAL ESTIMADO FORMALIZACIÓN: $", costoTotalFormalizacion
	Escribir "------------------------------------------------------------"
	
	// --- PASO 3: SIMULADOR DE FACTURACIÓN SIMPLE ---
	Escribir ""
	Escribir "--- MÓDULO DE SIMULACIÓN DE FACTURACIÓN ---"
	Escribir "Ingrese el valor Subtotal de la venta ($ COP):"
	Leer subtotalVenta
	
	Escribir "¿La microempresa es Responsable de IVA? (1 = SÍ, 0 = NO):"
	Leer esResponsableIva
	
	Si esResponsableIva = 1 Entonces
		valorIva <- subtotalVenta * 0.19
	Sino
		valorIva <- 0
	Fin Si
	
	totalFactura <- subtotalVenta + valorIva
	
	Escribir ""
	Escribir "============================================================"
	Escribir "                 FACTURA DE VENTA SIMULADA"
	Escribir "============================================================"
	Escribir " Emisor: ", Mayusculas(razonSocial)
	Escribir " NIT: ", nitRut
	Escribir " Subtotal: $", subtotalVenta
	Escribir " IVA (19%): $", valorIva
	Escribir " TOTAL A PAGAR: $", totalFactura
	Escribir "============================================================"
FinAlgoritmo
