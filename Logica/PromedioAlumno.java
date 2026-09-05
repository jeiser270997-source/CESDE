import java.util.Scanner;

public class PromedioAlumno {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        // Declaración e inicialización de variables al inicio
        String nombre = "";
        double promedio = 0.0;
        String mensaje = "";

        System.out.print("Ingrese el nombre del estudiante: ");
        nombre = teclado.nextLine();

        System.out.print("Ingrese el promedio del estudiante: ");
        promedio = teclado.nextDouble();

        // Condicional anidado
        if (promedio >= 3.0) {
            mensaje = "Aprobó";
        } else {
            if (promedio >= 2.0) {
                mensaje = "Aplica para proceso de mejoramiento de promedio";
            } else {
                mensaje = "Reprobó";
            }
        }

        System.out.println("El estudiante " + nombre + " " + mensaje + " la materia ya que su promedio fue: " + promedio);

        teclado.close();
    }
}
