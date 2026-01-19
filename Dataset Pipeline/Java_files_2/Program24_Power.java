public class Program24_Power {
    public static void main(String[] args) {
        int base = 2;
        int exp = 5;
        int result = 1;
        for(int i = 1; i <= exp; i++){
            result = result * base;
        }
        System.out.println(result);
    }
}
