//done ✅
public class TestCase19 {
    public static void displayAcos() {
        double x = 0.5;
        if (x >= -1 && x <= 1) {
            double val = Math.acos(x);
            System.out.println("acos(" + x + ") = " + val);
        } else {
            System.out.println("Input out of range for acos");
        }
        return;
    }

    public static void main(String[] args) {
        displayAcos();
    }
}
