       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program66.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM66_REVERSENUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM66_REVERSENUMBER_GLOBAL
       01  num_main        PIC S9(5).
       01  rev_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_PROGRAM66_REVERSENUMBER_GLOBAL
       01  d_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1234 TO num_main
       MOVE 0 TO rev_main
       PERFORM UNTIL NOT (num_main > 0)
       DIVIDE num_main BY 10 GIVING d_main REMAINDER d_main
       COMPUTE TEMP_0 = rev_main * 10
       COMPUTE TEMP_1 = TEMP_0 + d_main
       COMPUTE rev_main = TEMP_1
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
       DISPLAY rev_main
       EXIT.


