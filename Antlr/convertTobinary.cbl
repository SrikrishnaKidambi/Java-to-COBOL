       IDENTIFICATION DIVISION.
       PROGRAM-ID. convertTobinary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:convertTobinary
           05  ans_convertTobinary PIC S9(5).
           05  p_convertTobinary PIC S9(5).
           05  last_bit_convertTobinary PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
