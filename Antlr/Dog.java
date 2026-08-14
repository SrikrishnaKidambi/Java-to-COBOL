public class Dog {

    String name;

    int age;

    void speak() {
        System.out.println(name);
    }
}

class Main {

    public static void main(String[] args_main) {
        Dog d = new Dog();
        d.name = "Rex";
        d.age = 3;
        d.speak();
        System.out.println(d.age);
    }
}
