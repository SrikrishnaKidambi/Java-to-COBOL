public class Test47 {
    public static void display(String msg, int count) {
        msg=msg.toUpperCase();
        for(int i = 0; i < count; i++) {
            System.out.println(msg);
        }
    }
    public static void main(String[] args) {
        display("hello",5);
    }
}
