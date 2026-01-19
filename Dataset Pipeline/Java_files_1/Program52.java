public class Program52 {
    public static void main(String[] args) {
        int x = 5;
        int y = 1;
        do{
            y = y * x;
            x = x - 1;
        } while(x > 0);
        System.out.println(y);
    }
}
