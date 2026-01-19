public class Program62_CountEvenNumbers {
    public static void main(String[] args) {
        int limit = 20;
        int count = 0;

        for (int i = 1; i <= limit; i++) {
            if (i % 2 == 0) {
                count = count + 1;
            }
        }

        System.out.println(count);
    }
}