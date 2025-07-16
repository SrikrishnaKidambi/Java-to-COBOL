// done ✅
import java.util.Scanner;

public class Test {

    public static void main(String[] args_main) {
        Scanner sc_main = new Scanner(System.in);
        System.out.print("Enter a lowercase letter: ");
        char ch_main = sc_main.next().charAt(0);
        int position_main = ch_main - 'a' + 1;
        System.out.println("Position in alphabet: " + position_main);
    }
}
