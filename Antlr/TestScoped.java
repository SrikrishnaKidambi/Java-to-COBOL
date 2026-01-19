public class Program99 {

    public static void main(String[] args_main) {
        int a_main = 3;
        int b_main = 7;
        int sum_main = 0;
        for (int j_main = 0; j_main < a_main + b_main; j_main++) {
            sum_main = sum_main + j_main;
        }
        if (sum_main % 2 == 0) {
            System.out.println("Even Sum: " + sum_main);
        } else {
            System.out.println("Odd Sum: " + sum_main);
        }
    }
}
