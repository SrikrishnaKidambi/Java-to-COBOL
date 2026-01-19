public class Program70_MinOfThree {
    public static void main(String[] args) {
        int a = 8, b = 3, c = 5;
        int min;

        if (a <= b && a <= c) {
            min = a;
        } else if (b <= a && b <= c) {
            min = b;
        } else {
            min = c;
        }

        System.out.println(min);
    }
}