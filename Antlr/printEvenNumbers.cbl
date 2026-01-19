       IDENTIFICATION DIVISION.
       PROGRAM-ID. printEvenNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printEvenNumbers
           05  i_printEvenNumbers PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
