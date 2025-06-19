       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase18.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:FOR_BLOCK_METHOD_DISPLAYASINVALUES_CLASS_TEST_GLOBAL
       01  d_displayAsinValues PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_DISPLAYASINVALUES_CLASS_TEST_GLOBAL
       01  val_displayAsinValues PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayAsinValues-PARA.
       PERFORM VARYING d_displayAsinValues 
       FROM -1 BY 0.5 UNTIL NOT (d_displayAsinValues <= 1.0)
       COMPUTE d_displayAsinValues = -1.0
       COMPUTE val_displayAsinValues = 
       FUNCTION ASIN(d_displayAsinValues)
       DISPLAY "asin("  d_displayAsinValues  ") = "  
        d_displayAsinValues
       END-PERFORM.
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYASINVALUES-PARA
       EXIT.
       STOP RUN.

