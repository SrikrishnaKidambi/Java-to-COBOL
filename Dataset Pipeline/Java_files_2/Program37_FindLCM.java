public class Program37_FindLCM {
    public static void main(String[] args) {
        int a = 6;
        int b = 8;
        int max = a > b ? a : b;

        while (true) {
            if (max % a == 0 && max % b == 0) {
                System.out.println(max);
                break;
            }
            max = max + 1;
        }
    }
}