       IDENTIFICATION DIVISION.
       PROGRAM-ID. calc.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:calc
           05  z_calc       PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
