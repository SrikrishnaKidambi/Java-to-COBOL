public class Program73_CheckPrime {
    public static void main(String[] args) {
        int n = 29;
        boolean isPrime = true;

        for (int i = 2; i <= n / 2; i++) {
            if (n % i == 0) {
                isPrime = false;
            }
        }

        if (isPrime) {
            System.out.println(1);
        } else {
            System.out.println(0);
        }
    }
}