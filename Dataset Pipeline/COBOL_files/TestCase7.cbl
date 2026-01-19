       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase7.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:FOR_BLOCK_METHOD_DISPLAYSQUAREROOTS_CLASS_TEST_GLOBAL
       01  i_displaySquareRoots PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_DISPLAYSQUAREROOTS_CLASS_TEST_GLOBAL
       01  val_displaySquareRoots PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displaySquareRoots-PARA.
       PERFORM VARYING i_displaySquareRoots 
       FROM 1 BY 1 UNTIL NOT (i_displaySquareRoots <= 5)
       COMPUTE val_displaySquareRoots = 
       FUNCTION SQRT(i_displaySquareRoots)
       DISPLAY "Square root of "   i_displaySquareRoots   " is "  
        val_displaySquareRoots
       END-PERFORM.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYSQUAREROOTS-PARA
       EXIT.
       STOP RUN.

