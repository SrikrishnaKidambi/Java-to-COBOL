       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_FindPower.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FINDPOWER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FINDPOWER_GLOBAL
       01  scan_main       PIC X(100).
       01  x_main          PIC S9(5).
       01  n_main          PIC S9(5).
       01  ans_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_FINDPOWER_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT x_main
       ACCEPT n_main
       MOVE 1 TO ans_main
       IF x_main = 0
       IF n_main = 0
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       ELSE
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       MULTIPLY ans_main BY x_main GIVING ans_main
       END-PERFORM
       DISPLAY ans_main
       END-IF
       EXIT.


