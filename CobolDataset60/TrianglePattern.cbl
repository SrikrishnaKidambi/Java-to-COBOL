       IDENTIFICATION DIVISION.
       PROGRAM-ID. TrianglePattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  rows            PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  j               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number of rows: " WITH NO ADVANCING
       ACCEPT rows
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= rows)
       PERFORM VARYING j FROM 1 BY 1 UNTIL NOT (j <= i)
       DISPLAY "* " WITH NO ADVANCING
       END-PERFORM
       
       DISPLAY ""
       END-PERFORM.
       EXIT.
       STOP RUN.

