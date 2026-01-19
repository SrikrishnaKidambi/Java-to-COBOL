       IDENTIFICATION DIVISION.
       PROGRAM-ID. P25_IfElseMath.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P25_IFELSEMATH_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P25_IFELSEMATH_GLOBAL
       01  sc_main         PIC X(100).
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT a_main
       ACCEPT b_main
       IF a_main > b_main
       DISPLAY Math.max(a_main, b_main)
       ELSE
       DISPLAY Math.min(a_main, b_main)
       END-IF
       EXIT.


