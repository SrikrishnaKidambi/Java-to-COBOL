import java.util.Scanner;

public class SentenceCreator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter your favorite color: ");
        String color = sc.next();
        System.out.print("Enter your favorite animal: ");
        String animal = sc.next();

        String sentence = "You like a " + color + " " + animal + ".";
        System.out.println(sentence);
    }
}
