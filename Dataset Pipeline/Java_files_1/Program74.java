public class Program74_CountMultiplesOfThree {
    public static void main(String[] args) {
        int count = 0;

        for (int i = 1; i <= 50; i++) {
            if (i % 3 == 0) {
                count = count + 1;
            }
        }

        System.out.println(count);
    }
}