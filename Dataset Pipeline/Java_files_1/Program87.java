public class Program87 {
    public static void main(String[] args) {
        int a = 5;
        int b = 5;
        int sum = 0;

        for (int j = 0; j < a + b; j++) {
            sum = sum + j;
        }

        if (sum % 2 == 0) {
            System.out.println("Even Sum: " + sum);
        } else {
            System.out.println("Odd Sum: " + sum);
        }
    }
}
