public class TestScoped {

    public static int sumArray(int[] arr_sumArray) {
        int sum_sumArray = 0;
        for (int i_sumArray = 0; i_sumArray < arr_sumArray.length; i_sumArray++) sum_sumArray += arr_sumArray[i_sumArray];
        return sum_sumArray;
    }

    public static void main(String[] args_main) {
        int[] arr_main = new int[10];
        for (int i_main = 0; i_main < 10; i_main++) {
            arr_main[i_main] = 0;
        }
        sumArray(arr_main);
    }
}
