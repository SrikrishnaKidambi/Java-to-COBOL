public class Program89 {
    public static void main(String[] args) {
        int base = 2;
        int exp = 5;
        int result = 1;
        int i = 1;
        while(i <= exp){
            result = result * base;
            i++;
        }
        System.out.println(result);
    }
}