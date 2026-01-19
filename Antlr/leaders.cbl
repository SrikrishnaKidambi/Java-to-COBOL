       IDENTIFICATION DIVISION.
       PROGRAM-ID. leaders.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:leaders
           05  max_leaders  PIC S9(5).
           05  i_leaders    PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
