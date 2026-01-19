       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program80_SwapNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM80_SWAPNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM80_SWAPNUMBERS_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  temp_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE a_main TO temp_main
       MOVE b_main TO a_main
       MOVE temp_main TO b_main
       DISPLAY a_main
       DISPLAY b_main
       EXIT.


