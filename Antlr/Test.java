import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter first number: ");
        int a = sc.nextInt();
        System.out.print("Enter second number: ");
        int b = sc.nextInt();
        System.out.print("Enter operation (+, -, *, /): ");
        char op = sc.next().charAt(0);

        if (op == '+') {
            System.out.println("Sum: " + (a + b));
        }
        else if (op == '-') {
            System.out.println("Difference: " + (a - b));
        } 
        else if (op == '*') {
            System.out.println("Product: " + (a * b));
        } 
        else if (op == '/') {
            if (b != 0) {
                System.out.println("Quotient: " + ((double) a / b));
            } 
            else {
                System.out.println("Cannot divide by zero");
            }
        } 
        else {
            System.out.println("Invalid operation");
        }
    }
}