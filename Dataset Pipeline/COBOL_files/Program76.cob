       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program76.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM76_COMPARETWONUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM76_COMPARETWONUMBERS_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       IF a_main > b_main
       DISPLAY 1
       ELSE
       IF a_main < b_main
       DISPLAY 2
       ELSE
       DISPLAY 0
       END-IF
       END-IF
       EXIT.


