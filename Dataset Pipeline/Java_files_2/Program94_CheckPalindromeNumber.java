
public class Program94_CheckPalindromeNumber {
    public static void main(String[] args) {
        int n = 121;
        int temp = n, rev = 0;
        while(temp > 0) {
            rev = rev * 10 + (temp % 10);
            temp = temp / 10;
        }
        if(rev == n) System.out.println(1);
        else System.out.println(0);
    }
}
