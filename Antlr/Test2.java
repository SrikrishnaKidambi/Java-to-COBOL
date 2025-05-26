import java.util.Arrays;
import java.util.List;

public class Test2 {
    public static void main(String[] args) {
        int[] numbers = {10, 20, 30, 40};
        int[] arr=new int[9];

        for (int num : numbers) {
            System.out.println(num);
        }

        List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

        for (String name : names) {
            System.out.println(name);
        }
    }
}
