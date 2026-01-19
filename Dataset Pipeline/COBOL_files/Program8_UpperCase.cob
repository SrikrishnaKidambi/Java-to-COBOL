       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program8_UpperCase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM8_UPPERCASE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM8_UPPERCASE_GLOBAL
       01  s_main          PIC X(100).
       01  t_main          PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE "hello" TO s_main
       DISPLAY t_main
       EXIT.


