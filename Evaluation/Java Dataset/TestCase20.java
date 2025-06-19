//done ✅
public class TestCase20 {
    public static void displayMinimumCategory() {
        int a = 15;
        int b = 20;
        int min = Math.min(a, b);

        switch (min) {
            case 15:
                System.out.println("Minimum is 15");
                break;
            case 20:
                System.out.println("Minimum is 20");
                break;
            default:
                System.out.println("Unexpected minimum");
        }
        return;
    }

    public static void main(String[] args) {
        displayMinimumCategory();
    }
}
