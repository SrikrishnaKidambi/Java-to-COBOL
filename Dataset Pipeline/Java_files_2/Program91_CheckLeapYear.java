
public class Program91_CheckLeapYear {
    public static void main(String[] args) {
        int year = 2024;
        if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
            System.out.println(1);
        } else {
            System.out.println(0);
        }
    }
}
