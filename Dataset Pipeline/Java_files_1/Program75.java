public class Program75_ProductOfRange {
    public static void main(String[] args) {
        int prod = 1;

        for (int i = 2; i <= 5; i++) {
            prod = prod * i;
        }

        System.out.println(prod);
    }
}