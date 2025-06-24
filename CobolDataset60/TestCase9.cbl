       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase9.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYSINEVALUES_CLASS_TEST_GLOBAL
       01  i_displaySineValues PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_DISPLAYSINEVALUES_CLASS_TEST_GLOBAL
       01  angle_displaySineValues PIC S9(5)V9(2).
       01  val_displaySineValues PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displaySineValues-PARA.
       MOVE 0 TO i_displaySineValues
       PERFORM UNTIL NOT (i_displaySineValues <= 3)
       COMPUTE angle_displaySineValues = i_displaySineValues * 
       (3.14 / 2)
       COMPUTE val_displaySineValues =
        FUNCTION SIN(angle_displaySineValues)
       DISPLAY "sin("  angle_displaySineValues  ") = "  
        val_displaySineValues
       ADD 1 TO i_displaySineValues
       END-PERFORM
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYSINEVALUES-PARA
       EXIT.
       STOP RUN.

