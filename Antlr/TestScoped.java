import java.util.Scanner;

public class Test {

    public static void main(String[] args_main) {
        for (int i_main = 0; i_main < 9; i_main++) {
            int j_main = i_main;
            while (j_main > 0) {
                if (i_main == 0) {
                    System.out.println("Hello");
                    if (j_main == 0) {
                        System.out.println("WOW");
                    } else if (i_main == 1) {
                        System.out.println("Nice");
                        if (i_main % 2 == 0) {
                            System.out.println("I am batman");
                        }
                    }
                }
                switch(j_main) {
                    case 1:
                        System.out.println("this is 1");
                        break;
                    case 2:
                        System.out.println("This is 2");
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
