       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Reverse.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_REVERSE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_REVERSE_GLOBAL
       01  num_main        PIC S9(5).
       01  ans_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_REVERSE_GLOBAL
       01  rem_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 123456 TO num_main
       MOVE 0 TO ans_main
       PERFORM UNTIL NOT (num_main > 0)
       DIVIDE num_main BY 10 GIVING rem_main REMAINDER rem_main
       DIVIDE num_main BY 10 GIVING num_main
       COMPUTE TEMP_0 = ans_main * 10
       COMPUTE TEMP_1 = TEMP_0 + rem_main
       COMPUTE ans_main = TEMP_1
       END-PERFORM
       DISPLAY ans_main
       EXIT.


