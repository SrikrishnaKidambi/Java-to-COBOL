public class Program50_ProductSeries {
    public static void main(String[] args) {
        int i = 1;
        int prod = 1;

        while (i <= 10) {
            prod = prod * i;
            i = i + 1;
        }

        System.out.println(prod);
    }
}