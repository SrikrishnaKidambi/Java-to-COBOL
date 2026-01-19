       IDENTIFICATION DIVISION.
       PROGRAM-ID. rotate.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:rotate
           05  n_rotate     PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
