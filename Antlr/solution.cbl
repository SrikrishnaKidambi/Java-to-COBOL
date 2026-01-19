       IDENTIFICATION DIVISION.
       PROGRAM-ID. solution.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:solution
           05  sb_solution  PIC X(100).
           05  i_solution   PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
