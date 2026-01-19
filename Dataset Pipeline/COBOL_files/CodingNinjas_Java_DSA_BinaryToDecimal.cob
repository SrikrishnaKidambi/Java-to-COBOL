       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_BinaryToDecimal.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_BINARYTODECIMAL_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_BINARYTODECIMAL_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
       01  ans_main        PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_BINARYTODECIMAL_GLOBAL
       01  rem_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       MOVE 0 TO ans_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (N_main > 0)
       DIVIDE N_main BY 10 GIVING rem_main REMAINDER rem_main
       COMPUTE TEMP_0 = 2 * count_main
       COMPUTE TEMP_1 = pow + TEMP_0
       COMPUTE ans_main = TEMP_1
       ADD count_main TO 1 GIVING count_main
       DIVIDE N_main BY 10 GIVING N_main
       END-PERFORM
       DISPLAY ans_main
       EXIT.


