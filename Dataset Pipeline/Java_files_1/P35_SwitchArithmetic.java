import java.util.Scanner;

class P35_SwitchArithmetic {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int ch = sc.nextInt();

        switch (ch) {
            case 1: System.out.println(a + b); break;
            case 2: System.out.println(a - b); break;
            case 3: System.out.println(a * b); break;
            default: System.out.println(a / b);
        }
    }
}