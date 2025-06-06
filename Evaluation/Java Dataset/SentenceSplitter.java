//done ✅
import java.util.Scanner;

public class SentenceSplitter {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a sentence of 5 words: ");
        String line = sc.nextLine();
        // works only if the words array size is 5
        String[] words = line.split(" ");

        System.out.println("Words in the sentence:");
        for (int i = 0; i < 5; i++) {
            System.out.println(words[i]);
        }
    }
}
