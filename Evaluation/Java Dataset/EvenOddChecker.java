import java.util.Scanner;

public class EvenOddChecker {
    public static void main(String[] args) {
        checkEvenOdd();
    }

    static void checkEvenOdd() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int n = sc.nextInt();
        int rem = n % 2;
        if (rem == 0) {
            System.out.println("Even");
        } else {
            System.out.println("Odd");
        }
    }
}
