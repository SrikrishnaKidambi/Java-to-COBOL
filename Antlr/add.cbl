       IDENTIFICATION DIVISION.
       PROGRAM-ID. add.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:add
           05  z_add        PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
