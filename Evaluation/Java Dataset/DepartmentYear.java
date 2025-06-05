import java.util.Scanner;

public class DepartmentYear {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter department code (1: CSE, 2: ECE): ");
        int dept = sc.nextInt();

        System.out.print("Enter year (1/2/3/4): ");
        int year = sc.nextInt();

        switch (dept) {
            case 1:
                switch (year) {
                    case 1:
                        System.out.println("CSE First Year");
                        break;
                    case 2:
                        System.out.println("CSE Second Year");
                        break;
                    case 3:
                        System.out.println("CSE Third Year");
                        break;
                    case 4:
                        System.out.println("CSE Final Year");
                        break;
                    default:
                        System.out.println("Invalid year");
                }
                break;

            case 2:
                switch (year) {
                    case 1:
                        System.out.println("ECE First Year");
                        break;
                    case 2:
                        System.out.println("ECE Second Year");
                        break;
                    case 3:
                        System.out.println("ECE Third Year");
                        break;
                    case 4:
                        System.out.println("ECE Final Year");
                        break;
                    default:
                        System.out.println("Invalid year");
                }
                break;

            default:
                System.out.println("Invalid department");
        }
    }
}
