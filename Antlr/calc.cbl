       IDENTIFICATION DIVISION.
       PROGRAM-ID. calc.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:calc
           05  i            PIC S9(5).
           05  j            PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
