       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program70.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM70_MINOFTHREE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM70_MINOFTHREE_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01  min_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       IF a_main <= b_main  AND  a_main <= c_main
       MOVE a_main TO min_main
       ELSE
       IF b_main <= a_main  AND  b_main <= c_main
       MOVE b_main TO min_main
       ELSE
       MOVE c_main TO min_main
       END-IF
       END-IF
       DISPLAY min_main
       EXIT.


