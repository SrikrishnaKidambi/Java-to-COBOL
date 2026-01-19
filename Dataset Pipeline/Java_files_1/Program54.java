public class Program54 {
    public static void main(String[] args) {
        int a = 12;
        int b = 18;
        while(a != b){
            if(a > b){
                a = a - b;
            } else {
                b = b - a;
            }
        }
        System.out.println(a);
    }
}
