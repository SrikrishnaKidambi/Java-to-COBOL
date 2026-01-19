public class Program59 {
    public static void main(String[] args) {
        int n = 7;
        int flag = 1;
        for(int i = 2; i < n; i++){
            if(n % i == 0){
                flag = 0;
            }
        }
        System.out.println(flag);
    }
}
