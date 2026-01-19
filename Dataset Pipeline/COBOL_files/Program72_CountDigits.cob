       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program72_CountDigits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM72_COUNTDIGITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM72_COUNTDIGITS_GLOBAL
       01  n_main          PIC S9(5).
       01  count_main      PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 12345 TO n_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 10 GIVING n_main
       ADD 1 TO count_main
       END-PERFORM
       DISPLAY count_main
       EXIT.


