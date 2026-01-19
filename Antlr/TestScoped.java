<<<<<<< HEAD
// Question Link: https://www.geeksforgeeks.org/problems/minimum-number-of-jumps-1587115620/1
class Solution {

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
            }
        }
        // If the loop ends without reaching the last element
        return -1;
=======
public class TestScoped {

    public static void main(String[] args_main) {
        int a_main = 2;
        int b_main = 3;
        int i_main = 0;
        int n_main = 0;
        while (i_main < a_main + b_main) {
            for (int j_main = 0; j_main < n_main + 2; j_main++) {
                a_main++;
                i_main++;
            }
        }
>>>>>>> 28b8c928417ac931a4bf3d5a3b0f39cef431571d
    }
}
