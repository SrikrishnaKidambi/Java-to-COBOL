       IDENTIFICATION DIVISION.
       PROGRAM-ID. toggleCase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:toggleCase
           05  ans_toggleCase PIC X(100).
           05  i_toggleCase PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
