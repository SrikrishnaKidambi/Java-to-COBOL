public class Program88 {
    public static void main(String[] args) {
        int num = 29;
        boolean prime = true;
        int i = 2;
        while(i <= num/2){
            if(num % i == 0){
                prime = false;
            }
            i++;
        }
        if(prime){
            System.out.println("Prime");
        } else {
            System.out.println("Not Prime");
        }
    }
}