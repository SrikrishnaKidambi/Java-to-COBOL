       IDENTIFICATION DIVISION.
       PROGRAM-ID. sumArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:sumArray
           05  sum_sumArray PIC S9(5).
           05  i_sumArray   PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
