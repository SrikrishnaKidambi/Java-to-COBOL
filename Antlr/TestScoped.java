public class TestScoped {

    static void check(int x_check) {
        if (x_check + 2 * 3 > 10) {
            System.out.println("BIG");
        } else {
            System.out.println("SMALL");
        }
    }

    public static void main(String[] args_main) {
        int p_main = 2;
        int q_main = 4;
        int r_main = 10;
        check(r_main + 1 - p_main + q_main);
    }
}
