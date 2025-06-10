       IDENTIFICATION DIVISION.
       PROGRAM-ID. Factorial.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  n               PIC S9(5).
       01  fact            PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a number: " WITH NO ADVANCING
       ACCEPT n
       MOVE 1 TO fact
       PERFORM VARYING i FROM 2 BY 1 UNTIL NOT (i <= n)
       MULTIPLY fact BY i GIVING fact
       END-PERFORM.
       DISPLAY "Factorial of "   n   " is "   fact.
       EXIT.
       STOP RUN.

