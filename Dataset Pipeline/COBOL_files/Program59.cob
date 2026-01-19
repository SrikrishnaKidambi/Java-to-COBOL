       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program59.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM59_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM59_GLOBAL
       01  n_main          PIC S9(5).
       01  flag_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM59_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 7 TO n_main
       MOVE 1 TO flag_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main < n_main)
       DIVIDE n_main BY i_main GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       MOVE 0 TO flag_main
       END-IF
       END-PERFORM
       DISPLAY flag_main
       EXIT.


