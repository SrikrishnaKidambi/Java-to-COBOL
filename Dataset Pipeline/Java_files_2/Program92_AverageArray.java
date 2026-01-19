
public class Program92_AverageArray {
    public static void main(String[] args) {
        int[] arr = {2,4,6,8};
        int sum = 0;
        for(int i = 0; i < 4; i++) {
            sum = sum + arr[i];
        }
        System.out.println(sum / 4);
    }
}
