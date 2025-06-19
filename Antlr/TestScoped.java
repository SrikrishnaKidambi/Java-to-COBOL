//done ✅
import java.util.Scanner;

public class Test {

    public static void main(String[] args_main) {
        Scanner sc_main = new Scanner(System.in);
        System.out.print("Find primes up to: ");
        int n_main = sc_main.nextInt();
        for (int i_main = 2; i_main <= n_main; i_main++) {
            boolean isPrime_main = true;
            for (int j_main = 2; j_main <= i_main / 2; j_main++) {
                int rem_main = i_main % j_main;
                if (rem_main == 0) {
                    isPrime_main = false;
                    break;
                }
            }
            if (isPrime_main) {
                System.out.println(i_main + " is prime");
            }
        }
    }
}
