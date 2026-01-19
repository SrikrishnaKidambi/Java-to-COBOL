import java.util.Scanner;

class P2_AbsDiff {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int x = sc.nextInt();
        int y = sc.nextInt();

        int diff = x - y;
        if (diff < 0)
            diff = Math.abs(diff);

        System.out.println(diff);
    }
}
