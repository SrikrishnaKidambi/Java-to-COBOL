public class Test {

    public static void displayMinimumCategory() {
        int a_displayMinimumCategory = 15;
        int b_displayMinimumCategory = 20;
        int min_displayMinimumCategory = Math.min_displayMinimumCategory(a_displayMinimumCategory, b_displayMinimumCategory);
        switch(min_displayMinimumCategory) {
            case 15:
                System.out.println("Minimum is 15");
                break;
            case 20:
                System.out.println("Minimum is 20");
                break;
            default:
                System.out.println("Unexpected minimum");
        }
        return;
    }

    public static void main(String[] args_main) {
        displayMinimumCategory();
    }
}
