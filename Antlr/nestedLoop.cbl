       IDENTIFICATION DIVISION.
       PROGRAM-ID. nestedLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:nestedLoop
           05  i_nestedLoop PIC S9(5).
           05  j_nestedLoop PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
