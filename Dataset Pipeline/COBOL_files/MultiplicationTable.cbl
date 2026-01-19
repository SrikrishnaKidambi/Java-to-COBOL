       IDENTIFICATION DIVISION.
       PROGRAM-ID. MultiplicationTable.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  num             PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  val             PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number: " WITH NO ADVANCING
       ACCEPT num
       PERFORM VARYING i FROM 1 BY 1 UNTIL NOT (i <= 10)
       MULTIPLY num BY i GIVING val
       DISPLAY num   " x "   i   " = "   val
       END-PERFORM.
       EXIT.
       STOP RUN.

