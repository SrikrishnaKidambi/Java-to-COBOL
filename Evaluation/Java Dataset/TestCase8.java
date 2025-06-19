//done ✅
public class TestCase8 {
    public static void displayMax() {
        int a = 7 ;
        int b = 3;
        int max = Math.max(a, b);

        switch (max) {
            case 7:
                System.out.println("Maximum is 7");
                break;
            case 3:
                System.out.println("Maximum is 3");
                break;
            default:
                System.out.println("Unexpected value");
        }
        return;
    }

    public static void main(String[] args) {
        displayMax();
    }
}
