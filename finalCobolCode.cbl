       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  value           PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 50 TO value
       PERFORM VARYING i FROM 0 BY 1 UNTIL NOT (i < 10)
       IF value  <  100
       IF true
       DISPLAY "small"
       END-IF
       ELSE
       IF i = 0
       DISPLAY "HI"
       END-IF
       END-IF
       END-PERFORM.
       EXIT.
       STOP RUN.

