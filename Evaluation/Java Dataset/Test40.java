public class Test40 {
    public static void checkMultiple(int n, int m) {
        if (n % m == 0)
            System.out.println(n + " is a multiple of " + m);
        else
            System.out.println(n + " is not a multiple of " + m);
    }
    public static void main(String[] args) {
        int x=10;
        int u=100;
        checkMultiple(x, u);
    }
}
