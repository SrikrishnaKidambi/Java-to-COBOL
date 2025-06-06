       IDENTIFICATION DIVISION.
       PROGRAM-ID. LargestOfThree.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  a               PIC S9(5).
       01  b               PIC S9(5).
       01  c               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter three numbers: " WITH NO ADVANCING
       ACCEPT a
       ACCEPT b
       ACCEPT c
       IF a >= b AND a >= c
       DISPLAY a   " is largest"
       ELSE
       IF b >= a AND b >= c
       DISPLAY b   " is largest"
       ELSE
       DISPLAY c   " is largest"
       END-IF
       END-IF
       EXIT.
       STOP RUN.

