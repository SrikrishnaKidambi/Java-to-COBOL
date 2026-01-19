public class RandomRange {
    public static void main(String[] args) {
        int r = (int)(Math.random() * 10);

        if (r < 5) {
            System.out.println("Small");
        } else {
            System.out.println("Large");
        }
    }
}