       IDENTIFICATION DIVISION.
       PROGRAM-ID. fact.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:fact
           05  f_fact       PIC S9(5).
           05  i_fact       PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
