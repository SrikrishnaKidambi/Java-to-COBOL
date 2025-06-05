public class Test27 {
    static void printSignClassification() {
        for (int n = -1; n <= 1; n++) {
            if (n < 0) {
                System.out.println("negative");
            } else if (n == 0) {
                System.out.println("zero");
            } else {
                System.out.println("positive");
            }
        }
    }

    public static void main(String[] args) {
        printSignClassification();
    }
}
