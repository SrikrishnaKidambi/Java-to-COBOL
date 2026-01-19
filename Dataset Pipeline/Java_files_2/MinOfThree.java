public class MinOfThree {
    public static void main(String[] args) {
        int a = 12;
        int b = 7;
        int c = 20;

        int min = a;

        if (b < min) min = b;
        if (c < min) min = c;

        System.out.println(min);
    }
}