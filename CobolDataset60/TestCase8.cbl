       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase8.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYMAX_CLASS_TEST_GLOBAL
       01  a_displayMax    PIC S9(5).
       01  b_displayMax    PIC S9(5).
       01  max_displayMax  PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayMax-PARA.
       MOVE 7 TO a_displayMax
       MOVE 3 TO b_displayMax
       COMPUTE max_displayMax = FUNCTION MAX(a_displayMax  b_displayMax)
       EVALUATE max_displayMax
       WHEN 7
       DISPLAY "Maximum is 7"
       WHEN 3
       DISPLAY "Maximum is 3"
       WHEN OTHER
       DISPLAY "Unexpected value"
       END-EVALUATE
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYMAX-PARA
       EXIT.
       STOP RUN.

