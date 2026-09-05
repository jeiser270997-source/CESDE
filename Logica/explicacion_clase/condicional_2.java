import java.util.Scanner;
public class condicional_2 {
  public static void main(String[] args) {
    Scanner leer = new Scanner (System.in);
    int numero = 0;
    System.out.println("Ingrese un numero Entero");
    numero = leer.nextInt();
    if (numero %2==0) {
      System.out.println("El numero es Par");
    } else {System.out.println("El Numero es Impar");}
  }
  }
