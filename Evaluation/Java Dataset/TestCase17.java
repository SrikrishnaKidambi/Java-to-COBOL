//done ✅
public class TestCase17 {
    public static void checkSign() {
        int num = -25;
        float sign = Math.signum(num);

        if (sign > 0) {
            System.out.println("Number is positive");
        } else if (sign < 0) {
            System.out.println("Number is negative");
        } else {
            System.out.println("Number is zero");
        }
        return;
    }

    public static void main(String[] args) {
        checkSign();
    }
}
