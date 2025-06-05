public class SumNaturalNumbers {
    public static void main(String[] args) {
        sumFirst10();
    }

    static void sumFirst10() {
        int sum = 0;
        for (int i = 1; i <= 10; i++) {
            sum = sum + i;
        }
        System.out.println("Sum = " + sum);
    }
}
