//done ✅
public class PrimeNumbers50 {
    public static void main(String[] args) {
        int num = 2;
        System.out.println("First 50 prime numbers are: ");
        while (num <= 50) {
            boolean isPrime = true;
            int i = 2;
            while (i <= num / 2) {
                int rem = num % i;
                if (rem == 0) { // avoid using %
                    isPrime = false;
                    break;
                }
                i++;
            }

            if (isPrime) {
                System.out.println(num);
            }

            num++;
        }
    }
}
