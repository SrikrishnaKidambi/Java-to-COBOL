       IDENTIFICATION DIVISION.
       PROGRAM-ID. Fibonacci.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  n               PIC S9(5).
       01  a               PIC S9(5).
       01  b               PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  next1            PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number of terms: " WITH NO ADVANCING
       ACCEPT n
       MOVE 0 TO a
       MOVE 1 TO b
       DISPLAY "Fibonacci Series: " WITH NO ADVANCING
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= n)
       DISPLAY a   " " WITH NO ADVANCING
       ADD a TO b GIVING next1
       MOVE b TO a
       MOVE next1 TO b
       END-PERFORM.
       EXIT.
       STOP RUN.

