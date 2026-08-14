public class Test {
    String name;
    int age;
    void speak() { System.out.println(name); }
}
class Main {
    public static void main(String[] args) {
        Dog d = new Dog();
        d.name = "Rex";
        d.age = 3;
        d.speak();
        System.out.println(d.age);
    }
}