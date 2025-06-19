       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase19.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYACOS_CLASS_TEST_GLOBAL
       01  x_displayAcos   PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_DISPLAYACOS_CLASS_TEST_GLOBAL
       01  val_displayAcos PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayAcos-PARA.
       MOVE 0.5 TO x_displayAcos
       IF x_displayAcos >= -1 AND x_displayAcos <= 1
       COMPUTE val_displayAcos = FUNCTION ACOS(x_displayAcos)
       DISPLAY "acos("  x_displayAcos  ") = "   val_displayAcos
       ELSE
       DISPLAY "Input out of range for acos"
       END-IF.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYACOS-PARA
       EXIT.
       STOP RUN.

