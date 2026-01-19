public class Program42_CountEvenNumbers {
    public static void main(String[] args) {
        int i = 1;
        int count = 0;

        while (i <= 50) {
            if (i % 2 == 0) {
                count = count + 1;
            }
            i = i + 1;
        }

        System.out.println(count);
    }
}