       IDENTIFICATION DIVISION.
       PROGRAM-ID. printMax.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:printMax
           05  max_printMax PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
