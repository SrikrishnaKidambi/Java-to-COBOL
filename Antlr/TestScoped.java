//done ✅
import java.util.Scanner;

public class TestScoped {

    public static void main(String[] args_main) {
        Scanner sc_main = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num_main = sc_main.nextInt();
        int count_main = 0;
        while (num_main != 0) {
            count_main++;
            num_main = num_main / 10;
        }
        System.out.println("Number of digits: " + count_main);
    }
}
