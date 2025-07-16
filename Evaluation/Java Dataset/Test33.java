public class Test33 {
    public static void multiplyAndCheck(int a, int b) {
        int result = a * b;
        if (result > 100)
            System.out.println("Large");
        else
            System.out.println("Small");
    }
    public static void main(String[] args) {
        int x=10;
        int y=0;
        multiplyAndCheck(x, y);
    }
}
