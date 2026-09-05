package cesde.logica;

import java.util.Scanner;

/**
 * PROYECTO INTEGRADOR CESDE - NIVEL 1
 * Módulo: Lógica de Programación
 * Sistema: MiPrimeraEmpresa (Portal de Formalización & Facturación)
 * Refactorizado bajo Principios Gentleman Clean Code (SRP).
 */
public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        imprimirEncabezado();
        procesarFormalizacion(scanner);
        procesarFacturacion(scanner);

        scanner.close();
    }

    private static void imprimirEncabezado() {
        System.out.println("============================================================");
        System.out.println("     SISTEMA MIPRIMERAEMPRESA - SIMULADOR EN JAVA CONSOLA");
        System.out.println("============================================================");
    }

    private static void procesarFormalizacion(Scanner scanner) {
        System.out.print("Ingrese la Razón Social de la empresa: ");
        String razonSocial = scanner.nextLine();

        System.out.print("Ingrese el NIT o Cédula: ");
        String nitRut = scanner.nextLine();

        System.out.print("Ingrese el Capital Inicial ($ COP): ");
        double capitalInicial = scanner.nextDouble();

        double tarifaCamara = Math.max(capitalInicial * 0.007, 55000.0);
        double costoRut = 0.0; // Gratuito
        double impuestoIcaAnual = capitalInicial * 0.004;
        double costoTotal = tarifaCamara + costoRut + impuestoIcaAnual;

        System.out.println("\n------------------------------------------------------------");
        System.out.println("   RESUMEN DE ESTIMACIÓN DE FORMALIZACIÓN");
        System.out.println("------------------------------------------------------------");
        System.out.println(" Empresa: " + razonSocial.toUpperCase());
        System.out.println(" NIT/RUT: " + nitRut);
        System.out.printf(" Capital de Trabajo: $ %,.2f\n", capitalInicial);
        System.out.printf(" Costo Cámara de Comercio: $ %,.2f\n", tarifaCamara);
        System.out.println(" Trámite RUT DIAN: $ 0.00 (Gratuito)");
        System.out.printf(" Proyección Anual ICA: $ %,.2f\n", impuestoIcaAnual);
        System.out.printf(" COSTO TOTAL ESTIMADO: $ %,.2f\n", costoTotal);
        System.out.println("------------------------------------------------------------");
    }

    private static void procesarFacturacion(Scanner scanner) {
        System.out.println("\n--- MÓDULO DE EMISIÓN DE FACTURA ---");
        System.out.print("Ingrese el Subtotal de la Venta ($ COP): ");
        double subtotal = scanner.nextDouble();

        System.out.print("¿La empresa liquida IVA (19%)? (1 = SÍ, 0 = NO): ");
        int liquidaIva = scanner.nextInt();

        double valorIva = (liquidaIva == 1) ? (subtotal * 0.19) : 0.0;
        double totalFactura = subtotal + valorIva;

        System.out.println("\n============================================================");
        System.out.println("                 COMPROBANTE DE VENTA GENERADO");
        System.out.println("============================================================");
        System.out.printf(" Subtotal: $ %,.2f\n", subtotal);
        System.out.printf(" IVA (19%%): $ %,.2f\n", valorIva);
        System.out.printf(" TOTAL A PAGAR: $ %,.2f\n", totalFactura);
        System.out.println("============================================================");
    }
}
