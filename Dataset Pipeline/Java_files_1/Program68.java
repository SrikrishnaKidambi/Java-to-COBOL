public class Program68_PowerUsingLoop {
    public static void main(String[] args) {
        int base = 3;
        int exp = 4;
        int result = 1;

        for (int i = 1; i <= exp; i++) {
            result = result * base;
        }

        System.out.println(result);
    }
}