       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program6_RandomLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM6_RANDOMLOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM6_RANDOMLOOP_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM6_RANDOMLOOP_GLOBAL
       01  r_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 3)
       COMPUTE TEMP_0 = RANDOM * 10
       COMPUTE r_main = TEMP_0
       DISPLAY r_main
       END-PERFORM
       EXIT.


