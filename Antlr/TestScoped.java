//done ✅
public class Test {

    public static void displayAcos() {
        double x_displayAcos = 0.5;
        if (x_displayAcos >= -1 && x_displayAcos <= 1) {
            double val_displayAcos = Math.acos(x_displayAcos);
            System.out.println("acos(" + x_displayAcos + ") = " + val_displayAcos);
        } else {
            System.out.println("Input out of range for acos");
        }
        return;
    }

    public static void main(String[] args_main) {
        displayAcos();
    }
}
