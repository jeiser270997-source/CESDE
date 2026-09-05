import java.util.Scanner;
public class condicion_1 {
  public static void main(String[] args) {
    Scanner leer = new Scanner(System.in);
    String nombre = "";
    float promedio = 0;
    System.out.println("Nombre del Estudiante ");
    nombre=leer.nextLine();
    System.out.println("Nota promedio ");
    promedio=leer.nextFloat();
    if (promedio >= 3) {
      System.out.println("El Estudiante " + nombre + " Aprobó la Asignatura ");
    } else {
      if (promedio >= 2 && promedio <3) {
        System.out.println("El Estudiante " + nombre + " aplica para proceso de mejoramiento de promedio ");
      } else {
        System.out.println("El Estudiante " + nombre + " Reprobó la Asignatura ");
      }
    }
    System.out.println("con nota de " + promedio);
    System.out.println("Programa realizado por Jeiser Gutierrez");
  }
}
