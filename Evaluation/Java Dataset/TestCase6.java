// done ✅
import java.util.Scanner;

public class TestCase6 {
    public static void displayAbsolute() {
        Scanner input = new Scanner(System.in);
        int value = input.nextInt();
        if (value < 0) {
            value = Math.abs(value);
            System.out.println("Absolute Value: " + value);
        } else {
            System.out.println("Value is already positive: " + value);
        }
    }

    public static void main(String[] args) {
        displayAbsolute();
    }
}
