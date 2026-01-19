public class Test {

	public static void printSubstrings(String str){
        int count=1;
        while (count<=str.length())
        {
            //System.out.println("Printing substring with " + count + " characters");
            for (int i=0;i+count<=str.length();i++)
            {
                System.out.println(str.substring(i,i+count));
            }
            count=count+1;
        }
	}
<<<<<<< HEAD
}
=======
}
>>>>>>> c10d241639b7f70aa110c02d55ca59f650018278
