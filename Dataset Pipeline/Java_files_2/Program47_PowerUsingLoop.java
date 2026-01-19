public class Program47_PowerUsingLoop {
    public static void main(String[] args) {
        int base = 3, exp = 4;
        int result = 1;
        int i = 1;

        while (i <= exp) {
            result = result * base;
            i = i + 1;
        }

        System.out.println(result);
    }
}