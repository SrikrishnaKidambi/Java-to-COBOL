       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloPrinter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_PRINTHELLO_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM printHello-PARA
       EXIT.

       printHello-PARA.
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= 5)
       DISPLAY "Hello"
       END-PERFORM.
       EXIT.
       STOP RUN.

