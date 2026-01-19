       IDENTIFICATION DIVISION.
       PROGRAM-ID. print.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:print
           05  i_print      PIC S9(5).
           05  j_print      PIC S9(5).
           05  a_print      PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
