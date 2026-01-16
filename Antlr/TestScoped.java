//done ✅
public class TestScoped {

    public static void checkSign() {
        int num_checkSign = -25;
        float sign_checkSign = Math.signum(num_checkSign);
        if (sign_checkSign > 0) {
            System.out.println("Number is positive");
        } else if (sign_checkSign < 0) {
            System.out.println("Number is negative");
        } else {
            System.out.println("Number is zero");
        }
        return;
    }

    public static void main(String[] args_main) {
        checkSign();
    }
}
