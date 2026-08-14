public class Animal {
    String name;

    void speak() {
        System.out.println(name);
    }
}

class Dog extends Animal {
    int age;

    void speak() {
        System.out.println(name);
        System.out.println(age);
    }
}

class Main {
    public static void main(String[] args) {
        Dog d = new Dog();

        d.name = "Rex";
        d.age = 3;

        d.speak();
    }
}