// done ✅
import java.util.Scanner;

public class AlphabetPosition {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a lowercase letter: ");
        char ch = sc.next().charAt(0);
        
        int position = ch - 'a' + 1;
        System.out.println("Position in alphabet: " + position);
    }
}
