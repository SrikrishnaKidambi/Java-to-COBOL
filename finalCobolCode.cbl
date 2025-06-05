       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  arr-ARRAY      .
           05  arr          PIC S9(5) OCCURS 5 TIMES.
       01  scanner         PIC X(10).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       PERFORM VARYING i FROM 0 BY 1 UNTIL NOT (i < 5)
       MOVE 0 TO i
       PERFORM ARR-PARA
       END-PERFORM.
       DISPLAY "The contents of the array are:".
       PERFORM VARYING i FROM 0 BY 1 UNTIL NOT (i < 5)
       MOVE 0 TO i
       DISPLAY arr(i + 1)
       END-PERFORM.
       EXIT.
       STOP RUN.

