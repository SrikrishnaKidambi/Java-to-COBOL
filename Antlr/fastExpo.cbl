       IDENTIFICATION DIVISION.
       PROGRAM-ID. fastExpo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:fastExpo
           05  ans_fastExpo PIC S9(5).
           05  last_bit_fastExpo PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
