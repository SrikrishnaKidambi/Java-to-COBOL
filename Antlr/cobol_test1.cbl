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
