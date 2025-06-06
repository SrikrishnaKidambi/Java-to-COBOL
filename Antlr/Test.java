public class Test {
    public static void main(String[] args) {
        printMultiplesOf3();
    }

    static void printMultiplesOf3() {
        int i = 3;
        System.out.println("Multiples of 3 upto 30 are: ");
        while (i <= 30) {
            System.out.println(i);
            i = i + 3;
        }
	}
}