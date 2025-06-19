//done ✅
public class TestCase11 {
    public static void displayLog() {
        double x = 10;
        if (x > 0) {
            double val = Math.log(x);
            System.out.println("Natural log of " + x + " is " + Math.log(x));
        } else {
            System.out.println("Log undefined for non-positive numbers");
        }
    }

    public static void main(String[] args) {
        displayLog();
    }
}
