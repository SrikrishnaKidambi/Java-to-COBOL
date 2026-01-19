       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase6.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYABSOLUTE_CLASS_TEST_GLOBAL
       01  input_displayAbsolute PIC X(100).
       01  value_displayAbsolute PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayAbsolute-PARA.
      * Input from ODT is enabled
       ACCEPT value_displayAbsolute
       IF value_displayAbsolute < 0
       COMPUTE value_displayAbsolute = 
       FUNCTION ABS(value_displayAbsolute)
       DISPLAY "Absolute Value: "   value_displayAbsolute
       ELSE
       DISPLAY "Value is already positive: "   value_displayAbsolute
       END-IF.
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYABSOLUTE-PARA
       EXIT.
       STOP RUN.

