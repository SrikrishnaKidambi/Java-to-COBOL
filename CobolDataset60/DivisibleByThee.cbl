       IDENTIFICATION DIVISION.
       PROGRAM-ID. DivisibleByThree.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_PRINTMULTIPLESOF3_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM printMultiplesOf3-PARA
       EXIT.

       printMultiplesOf3-PARA.
       MOVE 3 TO i
       DISPLAY "Multiples of 3 upto 30 are: "
       PERFORM UNTIL NOT (i   <=  30)
       DISPLAY i
       ADD i TO 3 GIVING i
       END-PERFORM
       EXIT.
       STOP RUN.

