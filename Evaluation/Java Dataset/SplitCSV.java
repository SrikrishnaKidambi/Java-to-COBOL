import java.util.Scanner;

public class SplitCSV {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter comma-separated values (e.g., apple,banana,grape): ");
        String input = sc.nextLine();
        // works only if items array length is 5
        String[] items = input.split(",");

        System.out.println("Items in reverse order:");
        for (int i = 4; i >= 0; i--) {
            System.out.println(items[i]);
        }
    }
}
