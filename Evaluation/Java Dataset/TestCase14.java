//done ✅
public class TestCase14 {
    public static void convertToUppercase() {
        String lang = "java";
        lang = lang.toUpperCase();

        switch (lang) {
            case "JAVA":
                System.out.println("Language is JAVA");
                break;
            default:
                System.out.println("Unknown language");
        }
        return;
    }

    public static void main(String[] args) {
        convertToUppercase();
    }
}
