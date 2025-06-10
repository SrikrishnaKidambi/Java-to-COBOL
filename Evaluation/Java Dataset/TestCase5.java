import java.util.*;

public class TestCase5 {
    public static void main(String[] args) {
        char maxChar = Collections.max(Arrays.asList('A', 'b', 'Z', 'x'));
        char minChar = Collections.min(Arrays.asList('A', 'b', 'Z', 'x'));
        System.out.println("Max char: " + maxChar);  // x
        System.out.println("Min char: " + minChar);  // A
    }
}
