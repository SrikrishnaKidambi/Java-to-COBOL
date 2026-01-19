import java.util.Scanner;

class P25_IfElseMath {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();

        if (a > b)
            System.out.println(Math.max(a, b));
        else
            System.out.println(Math.min(a, b));
    }
}