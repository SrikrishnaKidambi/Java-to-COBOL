       IDENTIFICATION DIVISION.
       PROGRAM-ID. printUntilFive.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printUntilFive
           05  x            PIC S9(5).
       01  ARGS_[SIZE=[]]-ARRAY.
           05  args         PIC X(10) OCCURS 100 TIMES
