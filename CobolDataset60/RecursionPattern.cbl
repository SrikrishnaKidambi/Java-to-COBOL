       IDENTIFICATION DIVISION.
       PROGRAM-ID. PatternRecursion.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINTSTARS_CLASS_TESTSCOPED_GLOBAL
       01  count_printStars PIC S9(5).
      * Variables for Scope:METHOD_PRINTPATTERN_CLASS_TESTSCOPED_GLOBAL
       01  rows_printPattern PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  n_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       printStars-PARA.
       IF count_printStars = 0
      * base case
       GOBACK
       END-IF
       DISPLAY "* " WITH NO ADVANCING
       MOVE count_printStars - 1 TO count_printStars
       PERFORM printStars-PARA
       EXIT.


       printPattern-PARA.
       IF rows_printPattern = 0
      * base case
       GOBACK
       END-IF
      * first print previous rows
       MOVE rows_printPattern - 1 TO rows_printPattern
       PERFORM printPattern-PARA
      * then print current row
       MOVE rows_printPattern TO count_printStars
       PERFORM printStars-PARA
       DISPLAY ""
       EXIT.


       MAIN-PARA.
       MOVE 5 TO n_main
       MOVE n_main TO rows_printPattern
       PERFORM printPattern-PARA
       EXIT.


