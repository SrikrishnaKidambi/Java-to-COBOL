//done ✅
public class TestCase15 {
    public static void reverseString() {
        String original = "CobolMapping";
        String reversed = new StringBuilder(original).reverse().toString();

            System.out.println("Original: " + original);
            System.out.println("Reversed: " + reversed);
    }

    public static void main(String[] args) {
        reverseString();
    }
}
