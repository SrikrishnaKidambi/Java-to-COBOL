import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        int a = 5;
        int b = 10;
        //Basic move statement
        a = b;
        // Basic addition
        int c = a - b;

        // Compound assignment
        a -= b;

        // Postfix increment
        a--;

        // Prefix increment
        --a;

        // Postfix in assignment
        c = a--;

        // Prefix in assignment
        c = --a;

        // Print results to verify logic
        System.out.println("a = " + a);
        System.out.println("b = " + b);
        System.out.println("c = " + c);
    }
}