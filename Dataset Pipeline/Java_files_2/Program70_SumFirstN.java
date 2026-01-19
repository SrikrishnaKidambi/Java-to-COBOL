public class Program70_SumFirstN {
    public static void main(String[] args) {
        int n = 20;
        int sum = 0;

        for(int i=1;i<=n;i++){
            sum = sum + i;
        }

        System.out.println("Sum = " + sum);
    }
}
