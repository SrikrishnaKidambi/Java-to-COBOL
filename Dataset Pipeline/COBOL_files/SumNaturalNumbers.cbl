       IDENTIFICATION DIVISION.
       PROGRAM-ID. SumNaturalNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SUMFIRST10_CLASS_TEST_GLOBAL
       01  sum1             PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUMFIRST10_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM sumFirst10-PARA
       EXIT.

       sumFirst10-PARA.
       MOVE 0 TO sum1
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= 10)
       ADD sum1 TO i GIVING sum1
       END-PERFORM.
       DISPLAY "Sum = "   sum1.
       EXIT.
       STOP RUN.

