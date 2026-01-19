public class Program56_FindMaxThree {
    public static void main(String[] args) {
        int a = 10, b = 25, c = 15;
        int max;

        if(a > b && a > c) max = a;
        else if(b > c) max = b;
        else max = c;

        System.out.println(max);
    }
}