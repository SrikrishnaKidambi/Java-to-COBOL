       IDENTIFICATION DIVISION.
       PROGRAM-ID. multiplyAndCheck.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:multiplyAndCheck
           05  result_multiplyAndCheck PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
