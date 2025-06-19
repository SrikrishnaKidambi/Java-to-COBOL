//done ✅
public class TestCase10 {
    public static void displayRandomClassification() {
        double rand =Math.random();
        if (rand < 0.5) {
            System.out.println("Random value " + rand + " is less than 0.5");
        } else {
            System.out.println("Random value " + rand + " is 0.5 or more");
        }
        return;
    }

    public static void main(String[] args) {
        displayRandomClassification();
    }
}
