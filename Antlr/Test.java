public class Test {
    public static void main(String[] args) {
        for (int i = 1; i <= 100; i++) {
            int rem1= i % 3;
            int rem2= i % 7;
            if (rem1==0 && rem2==0) {
                System.out.println("First number divisible by both 3 and 7 is: " + i);
                break;
            }
        }
    }
}
