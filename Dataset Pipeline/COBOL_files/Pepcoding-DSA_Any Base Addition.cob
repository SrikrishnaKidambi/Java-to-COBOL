       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Any Base Addition.


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
      * Variables for Scope:METHOD_GETSUM_CLASS_MAIN_GLOBAL
       01  b_getSum        PIC S9(5).
       01  n1_getSum       PIC S9(5).
       01  n2_getSum       PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETSUM_CLASS_MAIN_GLOBAL
       01  ans_getSum      PIC S9(5).
       01  carry_getSum    PIC S9(5).
       01  power_getSum    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETSUM_CLASS_MAIN_GLOBAL
       01  l1_getSum       PIC S9(5).
       01  l2_getSum       PIC S9(5).
       01  sum_getSum      PIC S9(5).
       01  q_getSum        PIC S9(5).
       01  r_getSum        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getSum-PARA.
       MOVE 0 TO ans_getSum
       MOVE 0 TO carry_getSum
       MOVE 1 TO power_getSum
       PERFORM UNTIL NOT (n1_getSum NOT = 0  OR  n2_getSum NOT = 0  OR  carry_getSum NOT = 0)
       DIVIDE n1_getSum BY 10 GIVING l1_getSum REMAINDER l1_getSum
       DIVIDE n2_getSum BY 10 GIVING l2_getSum REMAINDER l2_getSum
       DIVIDE n1_getSum BY 10 GIVING n1_getSum
       DIVIDE n2_getSum BY 10 GIVING n2_getSum
       COMPUTE TEMP_0 = l1_getSum + l2_getSum
       COMPUTE TEMP_1 = TEMP_0 + carry_getSum
       COMPUTE sum_getSum = TEMP_1
       DIVIDE sum_getSum BY b_getSum GIVING q_getSum
       DIVIDE sum_getSum BY b_getSum GIVING r_getSum REMAINDER r_getSum
       COMPUTE TEMP_2 = r_getSum * power_getSum
       COMPUTE TEMP_3 = ans_getSum + TEMP_2
       COMPUTE ans_getSum = TEMP_3
       MOVE q_getSum TO carry_getSum
       MULTIPLY power_getSum BY 10 GIVING power_getSum
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT b_main
       ACCEPT n1_main
       ACCEPT n2_main
       MOVE getSum(b_main, n1_main, n2_main) TO d_main
       DISPLAY d_main
       EXIT.


