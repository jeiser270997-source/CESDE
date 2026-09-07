import java.util.Scanner;

public class SalarioTrabajador {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        // Declaración e inicialización de variables
        String nombre = "";
        int tipo_trabajador = 0;
        String tipo_texto = "";
        int horas_trabajadas = 0;
        double valor_hora = 0.0;
        double bonificaciones = 0.0;
        double deducciones = 0.0;
        double salario_bruto = 0.0;
        double salario_neto = 0.0;

        // Datos de entrada básicos
        System.out.println("Ingrese el nombre del trabajador:");
        nombre = leer.nextLine();

        System.out.println("Seleccione el tipo de vinculación (1: FIJO, 2: TEMPORAL):");
        tipo_trabajador = Integer.parseInt(leer.nextLine().trim());

        System.out.println("Ingrese las horas trabajadas en el mes:");
        horas_trabajadas = Integer.parseInt(leer.nextLine().trim());

        // Proceso condicional
        if (tipo_trabajador == 1) {
            tipo_texto = "FIJO";
            System.out.println("Ingrese el valor pactado por hora para trabajador FIJO:");
            valor_hora = Double.parseDouble(leer.nextLine().trim());

            System.out.println("Ingrese el valor total de bonificaciones:");
            bonificaciones = Double.parseDouble(leer.nextLine().trim());

            System.out.println("Ingrese el valor total de deducciones (salud/pensión):");
            deducciones = Double.parseDouble(leer.nextLine().trim());

            salario_bruto = horas_trabajadas * valor_hora;
            salario_neto = salario_bruto + bonificaciones - deducciones;
        } else {
            tipo_texto = "TEMPORAL";
            valor_hora = 6000.0;
            bonificaciones = 0.0;
            deducciones = 0.0;
            salario_bruto = horas_trabajadas * valor_hora;
            salario_neto = salario_bruto;
        }

        // Datos de salida
        System.out.println("==================================================");
        System.out.println("LIQUIDACIÓN DE NÓMINA - TRABAJADOR");
        System.out.println("Nombre: " + nombre);
        System.out.println("Tipo de Vinculación: " + tipo_texto);
        System.out.println("Horas Trabajadas: " + horas_trabajadas);
        System.out.println("Valor por Hora: $" + valor_hora);
        System.out.println("Salario Bruto: $" + salario_bruto);
        System.out.println("Bonificaciones: $" + bonificaciones);
        System.out.println("Deducciones: $" + deducciones);
        System.out.println("Salario Neto a Pagar: $" + salario_neto);
        System.out.println("==================================================");
        System.out.println("Programa realizado por Jeiser Gutierrez");

        leer.close();
    }
}
