public class Test {
<<<<<<< HEAD

    static void check(int x) {
        if (x + 2 * 3 > 10) {
            System.out.println("BIG");
        } else {
            System.out.println("SMALL");
        }
=======
    public static void main(String[] args) {
        int a = 5;
	int b = 7;
	int c = 8;
	int d = 9;
	
	d = a % b + c;
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63
    }

    public static void main(String[] args) {

        int p = 2;
        int q = 4;

        int r = 10;

        check(r + 1 - p + q);
    }
}
