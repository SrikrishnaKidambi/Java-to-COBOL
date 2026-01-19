       IDENTIFICATION DIVISION.
       PROGRAM-ID. replaceBits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:replaceBits
           05  mask_replaceBits PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
