//done ✅
import java.util.Scanner;

public class TestScoped {

    public static void main(String[] args_main) {
        Scanner sc_main = new Scanner(System.in);
        System.out.print("Enter first number: ");
        int a_main = sc_main.nextInt();
        System.out.print("Enter second number: ");
        int b_main = sc_main.nextInt();
        System.out.print("Enter operation (+, -, *, /): ");
        char op_main = sc_main.next().charAt(0);
        int res_main;
        if (op_main == '+') {
            res_main = a_main + b_main;
            System.out.println("Sum: " + res_main);
        } else if (op_main == '-') {
            res_main = a_main - b_main;
            System.out.println("Difference: " + res_main);
        } else if (op_main == '*') {
            res_main = a_main * b_main;
            System.out.println("Product: " + res_main);
        } else if (op_main == '/') {
            if (b_main != 0) {
                res_main = a_main / b_main;
                System.out.println("Quotient: " + res_main);
            } else {
                System.out.println("Cannot divide by zero");
            }
        } else {
            System.out.println("Invalid operation");
        }
    }
}
