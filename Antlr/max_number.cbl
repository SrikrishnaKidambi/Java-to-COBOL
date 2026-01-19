       IDENTIFICATION DIVISION.
       PROGRAM-ID. max_number.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:max_number
           05  maxNum_max_number PIC S9(5).
           05  i_max_number PIC S9(5).
           05  newNum_max_number PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
