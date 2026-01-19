public class LogTest {
    public static void main(String[] args) {
        int x = 10;

        double v = Math.log10(x);

        if (v > 0) {
            System.out.println("Positive Log");
        } else {
            System.out.println("Zero or Negative");
        }
    }
}