       IDENTIFICATION DIVISION.
       PROGRAM-ID. sum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:sum
           05  s_sum        PIC S9(5).
           05  i_sum        PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
