       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program37_FindLCM.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM37_FINDLCM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM37_FINDLCM_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  max_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 6 TO a_main
       MOVE 8 TO b_main
       PERFORM UNTIL NOT (true)
       DIVIDE max_main BY a_main GIVING TEMP_0 REMAINDER TEMP_0
       DIVIDE max_main BY b_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_0 = 0  AND  TEMP_1 = 0
       DISPLAY max_main
       EXIT PERFORM
       END-IF
       ADD max_main TO 1 GIVING max_main
       END-PERFORM
       EXIT.


