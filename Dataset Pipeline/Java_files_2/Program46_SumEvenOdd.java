public class Program46_SumEvenOdd {
    public static void main(String[] args) {
        int i = 1;
        int evenSum = 0, oddSum = 0;

        while (i <= 20) {
            if (i % 2 == 0) {
                evenSum = evenSum + i;
            } else {
                oddSum = oddSum + i;
            }
            i = i + 1;
        }

        System.out.println(evenSum);
        System.out.println(oddSum);
    }
}