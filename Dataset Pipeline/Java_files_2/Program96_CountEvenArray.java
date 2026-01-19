
public class Program96_CountEvenArray {
    public static void main(String[] args) {
        int[] arr = {1,2,3,4,6};
        int count = 0;
        for(int i = 0; i < 5; i++) {
            if(arr[i] % 2 == 0) count++;
        }
        System.out.println(count);
    }
}
