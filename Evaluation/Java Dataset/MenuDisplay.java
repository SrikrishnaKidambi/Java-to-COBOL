//done ✅
import java.util.Scanner;

public class MenuDisplay {
    public static void main(String[] args) {
        showMenu();
    }

    static void showMenu() {
        Scanner sc = new Scanner(System.in);
        System.out.println("1. Start");
        System.out.println("2. Settings");
        System.out.println("3. Exit");
        System.out.print("Enter your choice: ");
        int choice = sc.nextInt();

        switch (choice) {
            case 1:
                System.out.println("Starting...");
                break;
            case 2:
                System.out.println("Opening Settings...");
                break;
            case 3:
                System.out.println("Exiting...");
                break;
            default:
                System.out.println("Invalid Choice");
        }
    }
}
