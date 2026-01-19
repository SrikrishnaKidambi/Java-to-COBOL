public class Program52_CountPosNeg {
    public static void main(String[] args) {
        int[] arr = {2, -3, 4, -1, 0, 5};
        int pos = 0, neg = 0;

        for(int i = 0; i < arr.length; i++) {
            if(arr[i] > 0) pos++;
            else if(arr[i] < 0) neg++;
        }

        System.out.println(pos);
        System.out.println(neg);
    }
}