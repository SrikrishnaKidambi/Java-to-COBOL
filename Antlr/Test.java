//done ✅
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
        int res;
        if (op == '+') {
            res = a+b;
            System.out.println("Sum: " + res);
        }
        else if (op == '-') {
            res = a-b;
            System.out.println("Difference: " + res);
        } 
        else if (op == '*') {
            res = a*b;
            System.out.println("Product: " + res);
        } 
        else if (op == '/') {
            if (b != 0) {
                res = a/b;
                System.out.println("Quotient: " + res);
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