       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program40_SimpleInterest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM40_SIMPLEINTEREST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM40_SIMPLEINTEREST_GLOBAL
       01  p_main          PIC S9(5).
       01  t_main          PIC S9(5).
       01  r_main          PIC S9(5).
       01  si_main         PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1000 TO p_main
       MOVE 2 TO t_main
       MOVE 5 TO r_main
       COMPUTE TEMP_0 = p_main * t_main
       COMPUTE TEMP_1 = TEMP_0 * r_main
       COMPUTE TEMP_2 = TEMP_1 / 100
       COMPUTE si_main = TEMP_2
       DISPLAY si_main
       EXIT.


