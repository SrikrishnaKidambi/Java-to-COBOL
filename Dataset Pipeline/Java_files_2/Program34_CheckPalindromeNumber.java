public class Program34_CheckPalindromeNumber {
    public static void main(String[] args) {
        int num = 1221;
        int temp = num;
        int rev = 0;

        while (temp != 0) {
            rev = rev * 10 + (temp % 10);
            temp = temp / 10;
        }

        if (rev == num) {
            System.out.println(1);
        } else {
            System.out.println(0);
        }
    }
}