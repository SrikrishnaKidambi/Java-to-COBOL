public class Test41 {
    public static void chainCondition(int a, int b, int c) {
        if (a > b)
            if (a > c)
                System.out.println("a is largest");
            else
                System.out.println("c is largest");
        else if (b > c)
            System.out.println("b is largest");
        else
            System.out.println("c is largest");
    }
    public static void main(String[] args) {
        chainCondition(3, 4, 5);
    }
}
