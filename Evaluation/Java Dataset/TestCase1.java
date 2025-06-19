//done ✅
public class TestCase1 {
    public static void main(String[] args) {
        int a = 15;
        int b = 9;
        int minVal = Math.min(a, b);
        int modVal = Math.floorMod(-7, b);
        int signVal = Integer.signum(-5);

        System.out.println("Min: " + minVal);     // 9
        System.out.println("Mod: " + modVal);     // 2
        System.out.println("Sign: " + signVal);   // -1
    }
}
