public class Test5 {
    public static void main(String[] args) {
        int[] arr = new int[5];
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        for (int i = 0; i < 5; i++) {
            arr[i] = scanner.nextInt();
        }
        System.out.println("The sum of the array are:");
        int sum = 0;
        for (int i = 0; i < 5; i++) {
            sum += arr[i];
        }
        System.out.println(sum);
        scanner.close();
    }
}