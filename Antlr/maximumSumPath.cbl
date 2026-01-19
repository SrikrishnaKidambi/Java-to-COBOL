       IDENTIFICATION DIVISION.
       PROGRAM-ID. maximumSumPath.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:maximumSumPath
           05  maxSum_maximumSumPath PIC S9(5).
           05  sum1_maximumSumPath PIC S9(5).
           05  sum2_maximumSumPath PIC S9(5).
           05  i_maximumSumPath PIC S9(5).
           05  j_maximumSumPath PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
