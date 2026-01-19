       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program42_CountEvenNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM42_COUNTEVENNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM42_COUNTEVENNUMBERS_GLOBAL
       01  i_main          PIC S9(5).
       01  count_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1 TO i_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (i_main <= 50)
       DIVIDE i_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       ADD count_main TO 1 GIVING count_main
       END-IF
       ADD i_main TO 1 GIVING i_main
       END-PERFORM
       DISPLAY count_main
       EXIT.


