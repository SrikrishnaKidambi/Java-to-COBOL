public class Test {
    public static void nestedLoop(int a, int b) {
        for (int i = 0; i < a; i++) {
            for (int j = 0; j < b; j++) {
                System.out.println(i + "," + j);
            }
        }
    }
    public static void main(String[] args) {
        nestedLoop(9, 8);
    }
}
