       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  j_main          PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < 9)
       MOVE i_main TO j_main
       PERFORM UNTIL NOT (j_main > 0)
       IF i_main = 0
       DISPLAY "Hello"
       IF j_main = 0
       DISPLAY "WOW"
       ELSE
       IF i_main = 1
       DISPLAY "Nice"
       IF i_main % 2 = 0
       DISPLAY "I am batman"
       END-IF.
       END-IF.
       END-IF.
       END-IF.
       EVALUATE j_main
       WHEN 1
       DISPLAY "this is 1"
       WHEN 2
       DISPLAY "This is 2"
       WHEN OTHER
       END-EVALUATE
       END-PERFORM
       END-PERFORM.
       EXIT.
       STOP RUN.

