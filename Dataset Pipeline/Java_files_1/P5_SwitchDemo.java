import java.util.Scanner;

class P5_SwitchDemo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        switch (n) {
            case 1: System.out.println("ONE"); break;
            case 2: System.out.println("TWO"); break;
            default: System.out.println("OTHER");
        }
    }
}
