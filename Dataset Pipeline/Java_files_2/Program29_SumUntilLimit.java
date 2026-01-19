public class Program29_SumUntilLimit {
    public static void main(String[] args) {
        int sum = 0;
        int i = 1;
        while(sum < 50){
            sum = sum + i;
            i = i + 1;
        }
        System.out.println(sum);
    }
}
