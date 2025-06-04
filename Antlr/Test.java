public class Test {
    public static void main(String[] args) {
        int category = 2;
        int option = 1;

        switch (category) {
            case 1:
                System.out.println("Category: Fruits");
                switch (option) {
                    case 1:
                        System.out.println("Option: Apple");
                        break;
                    case 2:
                        System.out.println("Option: Banana");
                        break;
                    default:
                        System.out.println("Unknown fruit option");
                }
                break;

            case 2:
                System.out.println("Category: Vehicles");
                switch (option) {
                    case 1:
                        System.out.println("Option: Car");
                        break;
                    case 2:
                        System.out.println("Option: Bike");
                        break;
                    default:
                        System.out.println("Unknown vehicle option");
                }
                break;

            default:
                System.out.println("Invalid category");
        }
    }
}
