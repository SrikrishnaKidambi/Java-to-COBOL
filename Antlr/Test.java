public class Test {
    public static void main(String[] args) {
        String fullname= "Srikrishna Kidambi";
        String[] parts;
        parts= fullname.split(" ");
        String firstname;
        firstname = parts[0];
        String lastname = parts[1];
        String updatedFirstname = "Venkata " + parts[0] + 'd';
        int a = 8 + 7 + 9;
        System.out.println("Full name: "+fullname);
        System.out.println("First name: "+firstname);
        System.out.println("Last name: "+lastname);
        System.out.println("Updated First name: "+updatedFirstname);
    }
}
