       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program77.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM77_SUMSQUARES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM77_SUMSQUARES_GLOBAL
       01  sum_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM77_SUMSQUARES_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO sum_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 10)
       COMPUTE TEMP_0 = i_main * i_main
       COMPUTE TEMP_1 = sum_main + TEMP_0
       COMPUTE sum_main = TEMP_1
       END-PERFORM
       DISPLAY sum_main
       EXIT.


