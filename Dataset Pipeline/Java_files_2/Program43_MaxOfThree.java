public class Program43_MaxOfThree {
    public static void main(String[] args) {
        int a = 12, b = 45, c = 30;
        int max;

        if (a >= b && a >= c) {
            max = a;
        } else if (b >= a && b >= c) {
            max = b;
        } else {
            max = c;
        }

        System.out.println(max);
    }
}