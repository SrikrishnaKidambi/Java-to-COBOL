
public class Program79_CountPositives {
    public static void main(String[] args) {
        int[] arr = {-2,5,7,-1,4};
        int count = 0;
        for(int i = 0; i < 5; i++) {
            if(arr[i] > 0) count++;
        }
        System.out.println(count);
    }
}
