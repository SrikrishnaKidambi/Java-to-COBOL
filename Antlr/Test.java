import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        String grade= "A";
        //assigning the comments to the students according to the grades
        switch (grade) {
            case "A":
                System.out.println("Excellent");
                break;
            case "B":
                System.out.println("Good");
                break;
            default:
                System.out.println("Invalid");
        }
        int b=10;
    }
}