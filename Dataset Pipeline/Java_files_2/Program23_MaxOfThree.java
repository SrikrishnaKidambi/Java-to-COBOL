public class Program23_MaxOfThree {
    public static void main(String[] args) {
        int a = 15;
        int b = 22;
        int c = 9;
        int max = a;
        if(b > max){
            max = b;
        }
        if(c > max){
            max = c;
        }
        System.out.println(max);
    }
}
