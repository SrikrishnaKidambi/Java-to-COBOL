public class TestScoped {

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> c10d241639b7f70aa110c02d55ca59f650018278
>>>>>>> f4ea57214bb498955057266481072d99ccfac54d
    public static void printSubstrings(String str_printSubstrings) {
        int count_printSubstrings = 1;
        while (count_printSubstrings <= str_printSubstrings.length()) {
            //System.out.println("Printing substring with " + count + " characters");
            for (int i_printSubstrings = 0; i_printSubstrings + count_printSubstrings <= str_printSubstrings.length(); i_printSubstrings++) {
                System.out.println(str_printSubstrings.substring(i_printSubstrings, i_printSubstrings + count_printSubstrings));
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
>>>>>>> 422adfae6256fd8bc6ceb17b579a7c508a43b9be
    // Time Complexity = O(n), Space Complexity = O(1)
    static int minJumps(int[] arr_minJumps, int n_minJumps) {
        // If there's only one element, no jumps are needed
        if (n_minJumps == 1) {
            return 0;
        }
        // If the first element is 0, it's not possible to move anywhere
        if (arr_minJumps[0] == 0) {
            return -1;
        }
        // Initialize variables
        // Number of jumps made
        int jumps_minJumps = 0;
        // The farthest point reachable with the current number of jumps
        int currentEnd_minJumps = 0;
        // The farthest point reachable with the next jump
        int farthest_minJumps = 0;
        for (int i_minJumps = 0; i_minJumps < n_minJumps; i_minJumps++) {
            // Update the farthest point reachable
            farthest_minJumps = Math.max(farthest_minJumps, i_minJumps + arr_minJumps[i_minJumps]);
            // If we've reached the end of the array, return the number of jumps
            if (i_minJumps == currentEnd_minJumps) {
                jumps_minJumps++;
                currentEnd_minJumps = farthest_minJumps;
                // If the end of the array is within reach with the current jump
                if (currentEnd_minJumps >= n_minJumps - 1) {
                    return jumps_minJumps;
                }
<<<<<<< HEAD
=======
>>>>>>> a32651b2843df9819e4d5dbe30bd79b5f92bf8ac
>>>>>>> c10d241639b7f70aa110c02d55ca59f650018278
>>>>>>> 422adfae6256fd8bc6ceb17b579a7c508a43b9be
>>>>>>> f4ea57214bb498955057266481072d99ccfac54d
            }
        }
    }
}
