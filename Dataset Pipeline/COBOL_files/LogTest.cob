       IDENTIFICATION DIVISION.
       PROGRAM-ID. LogTest.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_LOGTEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_LOGTEST_GLOBAL
       01  x_main          PIC S9(5).
       01  v_main          PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 10 TO x_main
       COMPUTE v_main = x_main
       IF v_main > 0
       DISPLAY "Positive Log"
       ELSE
       DISPLAY "Zero or Negative"
       END-IF
       EXIT.


