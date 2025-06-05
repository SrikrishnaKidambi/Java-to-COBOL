import java.util.Scanner;

public class Test4 {
    public static void main(String[] args){
        int[] arr=new int[5];
        Scanner scanner=new Scanner(System.in);
        for(int i=0;i<5;i++){
            arr[i]=scanner.nextInt();
        }
        System.out.println("The contents of the array are:");
        for(int i=0;i<5;i++){
            System.out.println(arr[i]);
        }
        scanner.close();
    }
}