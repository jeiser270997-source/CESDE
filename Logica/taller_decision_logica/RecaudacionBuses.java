import java.util.Scanner;

public class RecaudacionBuses {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        // Declaración e inicialización de variables
        String placa_bus1 = "";
        int pasajeros_bus1 = 0;
        double pasaje_bus1 = 0.0;
        double recaudo_bus1 = 0.0;

        String placa_bus2 = "";
        int pasajeros_bus2 = 0;
        double pasaje_bus2 = 0.0;
        double recaudo_bus2 = 0.0;

        double total_general = 0.0;
        String mensaje_mayor = "";

        // Datos de entrada - Bus 1
        System.out.println("Ingrese la placa del primer bus:");
        placa_bus1 = leer.nextLine();

        System.out.println("Ingrese los pasajeros transportados por el bus " + placa_bus1 + ":");
        pasajeros_bus1 = Integer.parseInt(leer.nextLine().trim());

        System.out.println("Ingrese el valor del pasaje del bus " + placa_bus1 + ":");
        pasaje_bus1 = Double.parseDouble(leer.nextLine().trim());

        // Datos de entrada - Bus 2
        System.out.println("Ingrese la placa del segundo bus:");
        placa_bus2 = leer.nextLine();

        System.out.println("Ingrese los pasajeros transportados por el bus " + placa_bus2 + ":");
        pasajeros_bus2 = Integer.parseInt(leer.nextLine().trim());

        System.out.println("Ingrese el valor del pasaje del bus " + placa_bus2 + ":");
        pasaje_bus2 = Double.parseDouble(leer.nextLine().trim());

        // Proceso
        recaudo_bus1 = pasajeros_bus1 * pasaje_bus1;
        recaudo_bus2 = pasajeros_bus2 * pasaje_bus2;
        total_general = recaudo_bus1 + recaudo_bus2;

        if (recaudo_bus1 > recaudo_bus2) {
            mensaje_mayor = "El bus con placa " + placa_bus1 + " obtuvo la mayor recaudación ($" + recaudo_bus1 + ").";
        } else {
            if (recaudo_bus2 > recaudo_bus1) {
                mensaje_mayor = "El bus con placa " + placa_bus2 + " obtuvo la mayor recaudación ($" + recaudo_bus2 + ").";
            } else {
                mensaje_mayor = "Ambos buses obtuvieron la misma recaudación ($" + recaudo_bus1 + ").";
            }
        }

        // Datos de salida
        System.out.println("==================================================");
        System.out.println("Recaudo Bus 1 (" + placa_bus1 + "): $" + recaudo_bus1);
        System.out.println("Recaudo Bus 2 (" + placa_bus2 + "): $" + recaudo_bus2);
        System.out.println("Total General Recaudado: $" + total_general);
        System.out.println("Resultado: " + mensaje_mayor);
        System.out.println("==================================================");
        System.out.println("Programa realizado por Jeiser Gutierrez");

        leer.close();
    }
}
