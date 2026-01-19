public class Test {

    static void check(int x) {
        if (x + 2 * 3 > 10) {
            System.out.println("BIG");
        } else {
            System.out.println("SMALL");
        }
    }

    public static void main(String[] args) {

        int p = 2;
        int q = 4;

        int r = 10;

        check(r + 1 - p + q);
    }
}
