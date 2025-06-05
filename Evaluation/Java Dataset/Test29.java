public class Test29 {
    static void printUntilFive() {
        int x = 0;
        do {
            System.out.println(x);
            if (x == 5) break;
            x++;
        } while (x < 10);
    }

    public static void main(String[] args) {
        printUntilFive();
    }
}
