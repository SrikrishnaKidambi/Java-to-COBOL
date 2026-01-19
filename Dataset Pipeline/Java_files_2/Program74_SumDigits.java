
public class Program74_SumDigits {
    public static void main(String[] args) {
        int n = 9876;
        int sum = 0;
        while(n > 0) {
            sum = sum + (n % 10);
            n = n / 10;
        }
        System.out.println(sum);
    }
}
