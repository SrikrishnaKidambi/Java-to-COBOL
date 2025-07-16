public class Test37 {
    public static void printReverse(String s) {
        for (int i = s.length() - 1; i >= 0; i--)
            System.out.print(s.charAt(i));
        System.out.println();
    }
    public static void main(String[] args) {
        String s="Hello";
        printReverse(s);
    }
}
