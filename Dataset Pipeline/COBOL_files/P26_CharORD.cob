       IDENTIFICATION DIVISION.
       PROGRAM-ID. P26_CharORD.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P26_CHARORD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P26_CHARORD_GLOBAL
       01  c_main          PIC X(1).
       01  v_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 'C' TO c_main
       COMPUTE v_main = c_main
       DISPLAY v_main
       EXIT.


