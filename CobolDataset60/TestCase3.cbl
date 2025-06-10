       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase3.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  angle           PIC S9(5).
       01  sin45           PIC S9(5)V9(2).
       01  tan45           PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE 45 TO angle
       EVALUATE angle
       WHEN 45
       COMPUTE sin45 = FUNCTION SIN(angle)
       COMPUTE tan45 = FUNCTION TAN(angle)
       DISPLAY "sin(45°): "   sin45
       DISPLAY "tan(45°): "   tan45
       WHEN OTHER
       DISPLAY "Angle not handled"
       END-EVALUATE
       EXIT.
       STOP RUN.

