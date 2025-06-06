       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  value           PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter number: " WITH NO ADVANCING
       ACCEPT num
       MOVE 0 TO count
       PERFORM WITH TEST BEFORE
       ADD 1 TO count
       DIVIDE num BY 10 GIVING num
       UNTIL NOT (num  NOT =  0).
       PERFORM UNTIL NOT (num  NOT =  0)
       ADD 1 TO count
       DIVIDE num BY 10 GIVING num
       END-PERFORM
       DISPLAY "Number of digits: "   count
       EXIT.
       STOP RUN.

