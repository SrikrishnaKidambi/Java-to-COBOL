       IDENTIFICATION DIVISION.
       PROGRAM-ID. P16_CharLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P16_CHARLOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P16_CHARLOOP_GLOBAL
       01  c_main          PIC X(1).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_P16_CHARLOOP_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 'a' TO c_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 5)
       DISPLAY c_main
       MOVE FUNCTION CHAR( (FUNCTION ORD(c_main) + 1)) TO c_main
       END-PERFORM
       EXIT.


