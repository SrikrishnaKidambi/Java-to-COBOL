public class Program33_CountDigits {
    public static void main(String[] args) {
        int num = 45678;
        int count = 0;

        while (num != 0) {
            count = count + 1;
            num = num / 10;
        }

        System.out.println(count);
    }
}