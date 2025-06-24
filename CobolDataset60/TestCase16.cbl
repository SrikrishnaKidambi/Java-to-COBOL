       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYEXPONENTIAL_CLASS_TEST_GLOBAL
       01  base_displayExponential PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_DISPLAYEXPONENTIAL_CLASS_TEST_GLOBAL
       01  val_displayExponential PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayExponential-PARA.
       MOVE 2 TO base_displayExponential
       IF base_displayExponential = 2.0
       COMPUTE val_displayExponential = 
       FUNCTION EXP(base_displayExponential)
       DISPLAY "e^"   base_displayExponential   " = " 
         val_displayExponential
       END-IF.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYEXPONENTIAL-PARA
       EXIT.
       STOP RUN.

