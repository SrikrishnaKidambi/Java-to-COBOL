       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Any Base Subtraction.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  b_main          PIC S9(5).
       01  n1_main         PIC S9(5).
       01  n2_main         PIC S9(5).
       01  d_main          PIC S9(5).
      * Variables for Scope:METHOD_GETDIFFERENCE_CLASS_MAIN_GLOBAL
       01  b_getDifference PIC S9(5).
       01  n1_getDifference PIC S9(5).
       01  n2_getDifference PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETDIFFERENCE_CLASS_MAIN_GLOBAL
       01  ans_getDifference PIC S9(5).
       01  power_getDifference PIC S9(5).
       01  borrow_getDifference PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETDIFFERENCE_CLASS_MAIN_GLOBAL
       01  l1_getDifference PIC S9(5).
       01  l2_getDifference PIC S9(5).
       01  diff_getDifference PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getDifference-PARA.
       MOVE 0 TO ans_getDifference
       MOVE 1 TO power_getDifference
       MOVE 0 TO borrow_getDifference
       PERFORM UNTIL NOT (n2_getDifference NOT = 0)
       DIVIDE n1_getDifference BY 10 GIVING l1_getDifference REMAINDER l1_getDifference
       DIVIDE n2_getDifference BY 10 GIVING l2_getDifference REMAINDER l2_getDifference
       DIVIDE n1_getDifference BY 10 GIVING n1_getDifference
       DIVIDE n2_getDifference BY 10 GIVING n2_getDifference
       COMPUTE TEMP_0 = l2_getDifference - borrow_getDifference
       COMPUTE TEMP_1 = TEMP_0 - l1_getDifference
       COMPUTE diff_getDifference = TEMP_1
       IF diff_getDifference < 0
       ADD diff_getDifference TO b_getDifference GIVING diff_getDifference
       MOVE 1 TO borrow_getDifference
       ELSE
       MOVE 0 TO borrow_getDifference
       END-IF
       COMPUTE TEMP_2 = diff_getDifference * power_getDifference
       COMPUTE TEMP_3 = ans_getDifference + TEMP_2
       COMPUTE ans_getDifference = TEMP_3
       MULTIPLY power_getDifference BY 10 GIVING power_getDifference
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT b_main
       ACCEPT n1_main
       ACCEPT n2_main
       MOVE getDifference(b_main, n1_main, n2_main) TO d_main
       DISPLAY d_main
       EXIT.


