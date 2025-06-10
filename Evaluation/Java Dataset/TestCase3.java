public class TestCase3 {
    public static void main(String[] args) {
        int angle = 45;
        switch (angle) {
            case 45:
                double sin45 = Math.sin(angle);
                double tan45 = Math.tan(angle);
                System.out.println("sin(45°): " + sin45);
                System.out.println("tan(45°): " + tan45);
                break;
            default:
                System.out.println("Angle not handled");
        }
    }
}
