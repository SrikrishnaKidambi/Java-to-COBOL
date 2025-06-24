//done ✅
public class TestCase18 {
    public static void displayAsinValues() {
        for (double d = -1.0; d <= 1.0; d += 0.5) {
            double val = Math.asin(d);
            System.out.println("asin(" + d + ") = " + d);
        }
    }

    public static void main(String[] args) {
        displayAsinValues();
    }
}