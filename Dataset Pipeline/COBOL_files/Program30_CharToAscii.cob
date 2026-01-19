       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program30_CharToAscii.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM30_CHARTOASCII_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM30_CHARTOASCII_GLOBAL
       01  ch_main         PIC X(1).
       01  val_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 'A' TO ch_main
       MOVE ch_main TO val_main
       DISPLAY val_main
       EXIT.


