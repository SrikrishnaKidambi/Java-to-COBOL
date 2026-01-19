       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program5_MaxOfTwo.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM5_MAXOFTWO_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM5_MAXOFTWO_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  max_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO a_main
       MOVE 25 TO b_main
       COMPUTE max_main = b_main
       DISPLAY max_main
       EXIT.


