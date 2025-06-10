public class TestCase4 {
    public static void main(String[] args) {
        String ch = "a";
        int code = Character.codePointAt(ch, 0);
        System.out.println("CodePoint: " + code);  // 97

        String name = "java";
        System.out.println("Uppercase: " + name.toUpperCase());  // JAVA
    }
}
