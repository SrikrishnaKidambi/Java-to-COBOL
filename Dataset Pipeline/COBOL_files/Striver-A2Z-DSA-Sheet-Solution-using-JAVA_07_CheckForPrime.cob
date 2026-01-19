       IDENTIFICATION DIVISION.
       PROGRAM-ID. Striver-A2Z-DSA-Sheet-Solution-using-JAVA_07_CheckForPrime.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MINJUMPS_CLASS_SOLUTION_GLOBAL
       01  ARR_MINJUMPS_-ARRAY.
           05  arr_minJumps PIC S9(5) OCCURS 100 TIMES.
       01  n_minJumps      PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_MINJUMPS_CLASS_SOLUTION_GLOBAL
       01  jumps_minJumps  PIC S9(5).
       01  currentEnd_minJumps PIC S9(5).
       01  farthest_minJumps PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MINJUMPS_CLASS_SOLUTION_GLOBAL
       01  i_minJumps      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       minJumps-PARA.
      * If there's only one element, no jumps are needed
       IF n_minJumps = 1
       END-IF
      * If the first element is 0, it's not possible to move anywhere
       IF arr_minJumps[0] = 0
       END-IF
      * Initialize variables
      * Number of jumps made
       MOVE 0 TO jumps_minJumps
      * The farthest point reachable with the current number of jumps
       MOVE 0 TO currentEnd_minJumps
      * The farthest point reachable with the next jump
       MOVE 0 TO farthest_minJumps
       PERFORM VARYING i_minJumps FROM 0 BY 1 UNTIL NOT (i_minJumps < n_minJumps)
      * Update the farthest point reachable
       COMPUTE TEMP_0 = i_minJumps + 1
       COMPUTE TEMP_1 = arr_minJumps + TEMP_0
       COMPUTE farthest_minJumps = TEMP_1
      * If we've reached the end of the array, return the number of jumps
       IF i_minJumps = currentEnd_minJumps
       ADD 1 TO jumps_minJumps
       MOVE farthest_minJumps TO currentEnd_minJumps
      * If the end of the array is within reach with the current jump
       IF currentEnd_minJumps >= n_minJumps - 1
       END-IF
       END-IF
       END-PERFORM
      * If the loop ends without reaching the last element
       EXIT.


