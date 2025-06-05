import java.util.Scanner;

public class EvenOdd {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = sc.nextInt();
        int rem = num % 2;
        if (rem == 0) {
            System.out.println("Even number");
        } else {
            System.out.println("Odd number");
        }
    }
}
