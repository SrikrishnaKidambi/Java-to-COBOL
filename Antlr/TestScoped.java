public class TestScoped {

    public static void nestedLoop(int a_nestedLoop, int b_nestedLoop) {
        for (int i_nestedLoop = 0; i_nestedLoop < a_nestedLoop; i_nestedLoop++) {
            for (int j_nestedLoop = 0; j_nestedLoop < b_nestedLoop; j_nestedLoop++) {
                System.out.println(i_nestedLoop + "," + j_nestedLoop);
            }
        }
    }

    public static void main(String[] args_main) {
        nestedLoop(9, 8);
    }
}
