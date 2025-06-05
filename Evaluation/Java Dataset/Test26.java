public class Test26 {
    static void printEvenNumbers() {
        int i = 0;
        while (i < 10) {
            if (i % 2 == 0) {
                System.out.println(i);
            }
            i++;
        }
    }

    public static void main(String[] args) {
        printEvenNumbers();
    }
}
