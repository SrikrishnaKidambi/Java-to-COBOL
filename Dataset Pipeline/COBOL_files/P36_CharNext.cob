       IDENTIFICATION DIVISION.
       PROGRAM-ID. P36_CharNext.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P36_CHARNEXT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P36_CHARNEXT_GLOBAL
       01  c_main          PIC X(1).
       01  d_main          PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 'X' TO c_main
       MOVE FUNCTION CHAR( (FUNCTION ORD(c_main) + 2)) TO d_main
       DISPLAY c_main
       DISPLAY d_main
       EXIT.


