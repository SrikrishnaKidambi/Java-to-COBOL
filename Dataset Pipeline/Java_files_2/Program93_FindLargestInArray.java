
public class Program93_FindLargestInArray {
    public static void main(String[] args) {
        int[] arr = {3,7,2,9,5};
        int max = arr[0];
        for(int i = 1; i < 5; i++) {
            if(arr[i] > max) max = arr[i];
        }
        System.out.println(max);
    }
}
