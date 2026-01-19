       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program33_CountDigits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM33_COUNTDIGITS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM33_COUNTDIGITS_GLOBAL
       01  num_main        PIC S9(5).
       01  count_main      PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 45678 TO num_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (num_main NOT = 0)
       ADD count_main TO 1 GIVING count_main
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
       DISPLAY count_main
       EXIT.


