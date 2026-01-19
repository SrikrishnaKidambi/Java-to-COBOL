       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYLOG_CLASS_TEST_GLOBAL
       01  x_displayLog    PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_DISPLAYLOG_CLASS_TEST_GLOBAL
       01  val_displayLog  PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayLog-PARA.
       MOVE 10 TO x_displayLog
       IF x_displayLog > 0
       COMPUTE val_displayLog = FUNCTION LOG(x_displayLog)
       DISPLAY "Natural log of "   x_displayLog   " is "  
        val_displayLog
       ELSE
       DISPLAY "Log undefined for non-positive numbers"
       END-IF.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYLOG-PARA
       EXIT.
       STOP RUN.

