public class TestScoped {

    String name;

    int age;

    void speak() {
        System.out.println(name);
    }
}

class Main {

    public static void main(String[] args_main) {
        Dog d_main = new Dog();
        d_main.name = "Rex";
        d_main.age = 3;
        d_main.speak();
        System.out.println(d_main.age);
    }
}
