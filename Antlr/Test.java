import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        int a = 5;
        int b = 10;
        //Basic move statement
        a = b;
        int c=a%b;
        a%=b;
        a += ++a + b-- - --c ;
        // result += ++c;
        // Print results to verify logic
        System.out.println("a = " + a);
        System.out.println("b = " + b); // hello world
        System.out.println("c = " + c);
        // System.out.println("result= "+result);
    }
}