       IDENTIFICATION DIVISION.
       PROGRAM-ID. EvenNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 2 TO i
       DISPLAY "Even numbers upto 20 are: "
       PERFORM UNTIL NOT (i <= 20)
       DISPLAY i
       ADD i TO 2 GIVING i
       END-PERFORM
       EXIT.
       STOP RUN.

