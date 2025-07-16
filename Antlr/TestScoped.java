public class TestScoped {

    public static void chainCondition(int a_chainCondition, int b_chainCondition, int c_chainCondition) {
        if (a_chainCondition > b_chainCondition)
            if (a_chainCondition > c_chainCondition)
                System.out.println("a is largest");
            else
                System.out.println("c is largest");
        else if (b_chainCondition > c_chainCondition)
            System.out.println("b is largest");
        else
            System.out.println("c is largest");
    }

    public static void main(String[] args_main) {
        chainCondition(3, 4, 5);
    }
}
