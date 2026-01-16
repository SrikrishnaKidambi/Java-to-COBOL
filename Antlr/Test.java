public class Test {
    public static int sumArray(int[] arr) {
        int sum = 0;
        for (int i = 0; i < arr.length; i++)
            sum += arr[i];
        return sum;
    }
    public static void main(String[] args) {
        int[] arr=new int [10];
        for(int i=0;i<10;i++){
            arr[i]=0;
        }
        sumArray(arr);
    }
}
