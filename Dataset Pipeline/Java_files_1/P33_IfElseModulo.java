import java.util.Scanner;

class P33_IfElseModulo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        if (n % 5 == 0)
            System.out.println("DIVISIBLE BY 5");
        else
            System.out.println("NOT DIVISIBLE BY 5");
    }
}