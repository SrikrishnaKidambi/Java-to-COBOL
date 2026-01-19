       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program77_MinOfThree.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM77_MINOFTHREE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM77_MINOFTHREE_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01  min_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE a_main TO min_main
       IF b_main < min_main
       MOVE b_main TO min_main
       END-IF
       IF c_main < min_main
       MOVE c_main TO min_main
       END-IF
       DISPLAY min_main
       EXIT.


