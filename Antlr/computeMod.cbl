       IDENTIFICATION DIVISION.
       PROGRAM-ID. computeMod.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:computeMod
           05  r_computeMod PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
