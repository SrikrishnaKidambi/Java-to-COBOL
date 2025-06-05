public class DivisibleByThree {
    public static void main(String[] args) {
        printMultiplesOf3();
    }

    static void printMultiplesOf3() {
        for (int i = 1; i <= 30; i++) {
            if (i % 3 == 0) {
                System.out.println(i);
            }
        }
    }
}
