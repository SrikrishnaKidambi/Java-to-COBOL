       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_bitwise.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_BITWISE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_BITWISE_GLOBAL
       01  x_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO x_main
       DISPLAY (~x_main)
       EXIT.


