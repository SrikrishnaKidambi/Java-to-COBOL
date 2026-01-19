public class Program28_ProductEven {
    public static void main(String[] args) {
        int n = 10;
        int prod = 1;
        for(int i = 2; i <= n; i++){
            if(i % 2 == 0){
                prod = prod * i;
            }
        }
        System.out.println(prod);
    }
}
