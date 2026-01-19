public class Program45_FactorialLoop {
    public static void main(String[] args) {
        int n = 6;
        int fact = 1;
        int i = 1;

        while (i <= n) {
            fact = fact * i;
            i = i + 1;
        }

        System.out.println(fact);
    }
}