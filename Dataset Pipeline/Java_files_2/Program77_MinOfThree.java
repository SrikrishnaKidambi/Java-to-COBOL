
public class Program77_MinOfThree {
    public static void main(String[] args) {
        int a = 10, b = 25, c = 15;
        int min = a;
        if(b < min) min = b;
        if(c < min) min = c;
        System.out.println(min);
    }
}
