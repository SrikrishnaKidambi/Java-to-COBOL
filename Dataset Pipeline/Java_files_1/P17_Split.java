import java.util.Scanner;

class P17_Split {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();

        String[] parts = s.split(" ");

        for (int i = 0; i < parts.length; i++) {
            System.out.println(parts[i]);
        }
    }
}