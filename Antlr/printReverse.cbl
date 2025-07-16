       IDENTIFICATION DIVISION.
       PROGRAM-ID. printReverse.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printReverse
           05  i_printReverse PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
