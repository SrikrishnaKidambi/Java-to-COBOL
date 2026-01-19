       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_DecimalToBinary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_DECIMALTOBINARY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_DECIMALTOBINARY_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       DISPLAY Integer.toString(N_main, 2)
       EXIT.


