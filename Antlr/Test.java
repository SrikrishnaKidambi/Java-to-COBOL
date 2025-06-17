import java.util.Scanner;



public class Test {



    public static void main(String[] args) {

        for(int i=0;i<9;i++){

            int j=i;

            while(j>0){

                if(i==0){

                    System.out.println("Hello");

                    if(j==0){

                        System.out.println("WOW");

                    }else if(i==1){

                        System.out.println("Nice");

                        if(i%2==0){

                            System.out.println("I am batman");

                        }

                    }

                }

                switch (j) {

                    case 1:

                        System.out.println("this is 1");

                        break;

                    case 2: 

                    System.out.println("This is 2");

                    break;

                    default:

                        break;

                }

            }



        }

    }

}