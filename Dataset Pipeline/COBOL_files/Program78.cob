       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program78.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM78_COUNTDOWN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM78_COUNTDOWN_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO i_main
       PERFORM UNTIL NOT (i_main > 0)
       DISPLAY i_main
       SUBTRACT 1 FROM i_main
       END-PERFORM
       EXIT.


