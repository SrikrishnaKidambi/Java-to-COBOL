       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program99_CountDown.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM99_COUNTDOWN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM99_COUNTDOWN_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 5 BY -1 UNTIL NOT (i_main >= 1)
       DISPLAY i_main
       END-PERFORM
       EXIT.


