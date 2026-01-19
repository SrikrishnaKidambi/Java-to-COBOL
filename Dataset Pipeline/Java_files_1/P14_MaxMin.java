import java.util.Scanner;

class P14_MaxMin {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();

        System.out.println(Math.max(a, b));
        System.out.println(Math.min(a, b));
    }
}