       IDENTIFICATION DIVISION.
       PROGRAM-ID. P9_CharArithmetic.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P9_CHARARITHMETIC_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P9_CHARARITHMETIC_GLOBAL
       01  c_main          PIC X(1).
       01  next_main       PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 'A' TO c_main
       MOVE FUNCTION CHAR( (FUNCTION ORD(c_main) + 1)) TO next_main
       DISPLAY c_main
       DISPLAY next_main
       EXIT.


