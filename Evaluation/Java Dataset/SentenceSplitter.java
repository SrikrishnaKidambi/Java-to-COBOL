import java.util.Scanner;

public class SentenceSplitter {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a sentence: ");
        String line = sc.nextLine();
        // works only if the words array size is 2
        String[] words = line.split(" ");

        System.out.println("Words in the sentence:");
        for (int i = 0; i < 5; i++) {
            System.out.println(words[i]);
        }
    }
}
