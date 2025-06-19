//done ✅
public class TestCase9 {
    public static void displaySineValues() {
        int i = 0;
        while (i <= 3) {
            double angle = i * (3.14 / 2);
            double val =Math.sin(angle);
            System.out.println("sin(" + angle + ") = " + val);
            i++;
        }
        return;
    }

    public static void main(String[] args) {
        displaySineValues();
    }
}
