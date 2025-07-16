public class TestScoped {

    private static void add(int x_add, int y_add) {
        int z_add = x_add + y_add;
        System.out.println("The addition is :" + z_add);
    }

    public static void main(String[] args_main) {
        int x_main = 0;
        int u_main = 1;
        add(x_main, u_main);
    }
}
