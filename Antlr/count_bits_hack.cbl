       IDENTIFICATION DIVISION.
       PROGRAM-ID. count_bits_hack.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:count_bits_hack
           05  ans_count_bits_hack PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
