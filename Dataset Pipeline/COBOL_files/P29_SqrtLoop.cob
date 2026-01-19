       IDENTIFICATION DIVISION.
       PROGRAM-ID. P29_SqrtLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P29_SQRTLOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_P29_SQRTLOOP_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 5)
       DISPLAY Math.sqrt(i_main)
       END-PERFORM
       EXIT.


