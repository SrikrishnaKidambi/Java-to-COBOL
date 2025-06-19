public class TestCase12 {
    public static void displayLog10() {
        for (int i = 1; i <= 4; i++) {
            double val = Math.log10(i);
            System.out.println("Log base 10 of " + i + " is " + val);
        }
        return;
    }

    public static void main(String[] args) {
        displayLog10();
    }
}
