import java.util.Scanner;

public class MayorHermanos {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        // Declaración e inicialización de variables
        String nombre_hermano1 = "";
        int edad_hermano1 = 0;
        String nombre_hermano2 = "";
        int edad_hermano2 = 0;
        String nombre_mayor = "";
        int edad_mayor = 0;
        int diferencia_edad = 0;

        // Datos de entrada
        System.out.println("Ingrese el nombre del primer hermano:");
        nombre_hermano1 = leer.nextLine();

        System.out.println("Ingrese la edad del primer hermano:");
        edad_hermano1 = Integer.parseInt(leer.nextLine().trim());

        System.out.println("Ingrese el nombre del segundo hermano:");
        nombre_hermano2 = leer.nextLine();

        System.out.println("Ingrese la edad del segundo hermano:");
        edad_hermano2 = Integer.parseInt(leer.nextLine().trim());

        // Proceso condicional
        if (edad_hermano1 > edad_hermano2) {
            nombre_mayor = nombre_hermano1;
            edad_mayor = edad_hermano1;
            diferencia_edad = edad_hermano1 - edad_hermano2;
        } else {
            nombre_mayor = nombre_hermano2;
            edad_mayor = edad_hermano2;
            diferencia_edad = edad_hermano2 - edad_hermano1;
        }

        // Datos de salida
        System.out.println("==================================================");
        System.out.println("El hermano mayor es: " + nombre_mayor + " con " + edad_mayor + " años.");
        System.out.println("La diferencia de edad es de: " + diferencia_edad + " años.");
        System.out.println("==================================================");
        System.out.println("Programa realizado por Jeiser Gutierrez");

        leer.close();
    }
}
