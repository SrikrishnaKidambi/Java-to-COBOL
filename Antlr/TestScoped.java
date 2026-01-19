public class TestScoped {

    static void check(int x_check) {
        if (x_check + 2 * 3 > 10) {
            System.out.println("BIG");
        } else {
            System.out.println("SMALL");
        }
    }

    public static void main(String[] args_main) {
<<<<<<< HEAD
        int p_main = 2;
        int q_main = 4;
        int r_main = 10;
        check(r_main + 1 - p_main + q_main);
=======
        int a_main = 5;
        int b_main = 7;
        int c_main = 8;
        int d_main = 9;
        d_main = a_main % b_main + c_main;
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63
    }
}
