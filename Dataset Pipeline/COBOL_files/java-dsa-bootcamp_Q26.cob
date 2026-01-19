       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q26.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q26_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q26_GLOBAL
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q26_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 0 TO count_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 31)
       DIVIDE i_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       ADD 1 TO count_main
       END-IF
       END-PERFORM
       DISPLAY "No. of days = "
       DISPLAY count_main
       EXIT.


