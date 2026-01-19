public class Program67_SumUntilLimit {
    public static void main(String[] args) {
        int sum = 0;
        int i = 1;

        while(sum < 50){
            sum = sum + i;
            i++;
        }

        System.out.println("Final Sum = " + sum);
    }
}
