       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program47_PowerUsingLoop.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM47_POWERUSINGLOOP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM47_POWERUSINGLOOP_GLOBAL
       01  base_main       PIC S9(5).
       01  exp_main        PIC S9(5).
       01  result_main     PIC S9(5).
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1 TO result_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (i_main <= exp_main)
       MULTIPLY result_main BY base_main GIVING result_main
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
       DISPLAY result_main
       EXIT.


