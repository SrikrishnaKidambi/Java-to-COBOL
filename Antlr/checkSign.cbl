       IDENTIFICATION DIVISION.
       PROGRAM-ID. checkSign.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:checkSign
           05  num_checkSign PIC S9(5).
           05  sign_checkSign PIC S9(5)V9(2).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
