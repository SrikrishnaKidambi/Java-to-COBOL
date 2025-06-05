import java.util.Scanner;

public class LowerToUpper {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a lowercase letter: ");
        char ch = sc.next().charAt(0);

        char upper = (char)(ch - 32);
        System.out.println("Uppercase: " + upper);
    }
}
