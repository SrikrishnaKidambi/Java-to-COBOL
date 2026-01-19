       IDENTIFICATION DIVISION.
       PROGRAM-ID. P33_IfElseModulo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P33_IFELSEMODULO_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P33_IFELSEMODULO_GLOBAL
       01  sc_main         PIC X(100).
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       DIVIDE n_main BY 5 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY "DIVISIBLE BY 5"
       ELSE
       DISPLAY "NOT DIVISIBLE BY 5"
       END-IF
       EXIT.


