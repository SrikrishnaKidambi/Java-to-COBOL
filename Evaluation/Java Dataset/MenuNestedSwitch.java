//done ✅
import java.util.Scanner;

public class MenuNestedSwitch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Main Menu:");
        System.out.println("1. File");
        System.out.println("2. Edit");
        System.out.print("Enter your choice: ");
        int choice = sc.nextInt();

        switch (choice) {
            case 1:
                System.out.println("File Menu:");
                System.out.println("1. New");
                System.out.println("2. Open");
                int fileChoice = sc.nextInt();
                switch (fileChoice) {
                    case 1:
                        System.out.println("New File Created");
                        break;
                    case 2:
                        System.out.println("File Opened");
                        break;
                    default:
                        System.out.println("Invalid file menu option");
                }
                break;

            case 2:
                System.out.println("Edit Menu:");
                System.out.println("1. Cut");
                System.out.println("2. Paste");
                int editChoice = sc.nextInt();
                switch (editChoice) {
                    case 1:
                        System.out.println("Cut executed");
                        break;
                    case 2:
                        System.out.println("Paste executed");
                        break;
                    default:
                        System.out.println("Invalid edit menu option");
                }
                break;

            default:
                System.out.println("Invalid main menu choice");
        }
    }
}
