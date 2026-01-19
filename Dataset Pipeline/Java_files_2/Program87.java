public class Program87 {
    public static void main(String[] args) {
        int n = 10;
        int t1 = 0;
        int t2 = 1;
        int i = 1;
        while(i <= n){
            System.out.println(t1);
            int sum = t1 + t2;
            t1 = t2;
            t2 = sum;
            i++;
        }
    }
}