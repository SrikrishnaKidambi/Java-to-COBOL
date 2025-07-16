public class Test35 {
    public static void printMax(int a, int b, int c) {
        int max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        System.out.println(max);
    }
    public static void main(String[] args) {
        int x=0;
        int y=10,z=-1;
        printMax(x, y, z);
    }
}
