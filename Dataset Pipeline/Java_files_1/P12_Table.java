import java.util.Scanner;

class P12_Table {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        for (int i = 1; i <= 5; i++) {
            System.out.println(n * i);
        }
    }
}