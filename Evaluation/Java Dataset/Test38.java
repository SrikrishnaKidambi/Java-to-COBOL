public class Test38 {
    public static void countDown(int start) {
        while (start > 0) {
            System.out.println(start);
            start--;
        }
    }
    public static void main(String[] args) {
        countDown(10);
    }
}
