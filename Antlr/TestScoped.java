public class TestScoped {

    public static void printSubstrings(String str_printSubstrings) {
        int count_printSubstrings = 1;
        while (count_printSubstrings <= str_printSubstrings.length()) {
            //System.out.println("Printing substring with " + count + " characters");
            for (int i_printSubstrings = 0; i_printSubstrings + count_printSubstrings <= str_printSubstrings.length(); i_printSubstrings++) {
                System.out.println(str_printSubstrings.substring(i_printSubstrings, i_printSubstrings + count_printSubstrings));
            }
            count_printSubstrings = count_printSubstrings + 1;
        }
    }
}
