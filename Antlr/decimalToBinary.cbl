       IDENTIFICATION DIVISION.
       PROGRAM-ID. decimalToBinary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Method:decimalToBinary
           05  bin_decimalToBinary PIC S9(5).
           05  power_decimalToBinary PIC S9(5).
           05  dig_decimalToBinary PIC S9(5).
       01  ARGS_MAIN_[SIZE=[]]-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES
