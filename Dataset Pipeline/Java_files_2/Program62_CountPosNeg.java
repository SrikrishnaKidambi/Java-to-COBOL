public class Program62_CountPosNeg {
    public static void main(String[] args) {
        int[] arr = {-5,3,-2,7,0,-1,4};
        int pos = 0;
        int neg = 0;

        for(int i=0;i<arr.length;i++){
            if(arr[i] > 0){
                pos++;
            } else if(arr[i] < 0){
                neg++;
            }
        }

        System.out.println("Positive = " + pos);
        System.out.println("Negative = " + neg);
    }
}
