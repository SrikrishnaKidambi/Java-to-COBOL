       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program58_SumDigits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM58_SUMDIGITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM58_SUMDIGITS_GLOBAL
       01  num_main        PIC S9(5).
       01  sum_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1234 TO num_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (num_main > 0)
       DIVIDE num_main BY 10 GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = sum_main + TEMP_1
       COMPUTE sum_main = TEMP_2
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
       DISPLAY sum_main
       EXIT.


