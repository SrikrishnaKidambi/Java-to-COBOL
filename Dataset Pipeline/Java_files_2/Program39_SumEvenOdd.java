public class Program39_SumEvenOdd {
    public static void main(String[] args) {
        int n = 10;
        int evenSum = 0;
        int oddSum = 0;

        for (int i = 1; i <= n; i++) {
            if (i % 2 == 0) {
                evenSum = evenSum + i;
            } else {
                oddSum = oddSum + i;
            }
        }

        System.out.println(evenSum);
        System.out.println(oddSum);
    }
}