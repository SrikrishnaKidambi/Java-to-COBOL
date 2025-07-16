//done ✅
public class Test {
    public static void nestedLoop(int a, int b) {
        for (int i = 0; i < a; i++) {
            for (int j = 0; j < b; j++) {
                System.out.println(i + "," + j);
            }
        }
<<<<<<< HEAD
    public static void displayAcos() {
        double x = 0.5;
        if (x >= -1 && x <= 1) {
            double val = Math.acos(x);
            System.out.println("acos(" + x + ") = " + val);
        } else {
            System.out.println("Input out of range for acos");
        }
        return;
=======

    private static void add(int x,int y){
        int z=x+y;
        System.out.println("The addition is :"+z);
>>>>>>> 4cfd22ceb2cc758f7ac781cb4d3d1abd066d41ad
    }
    public static void main(String[] args) {
        int x=0;
        int u=1;
        add(x, u);
    }
}
