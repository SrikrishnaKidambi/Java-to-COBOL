       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Any Base Multiplication.


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
      * Variables for Scope:METHOD_GETPRODUCT_CLASS_MAIN_GLOBAL
       01  b_getProduct    PIC S9(5).
       01  n1_getProduct   PIC S9(5).
       01  n2_getProduct   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETPRODUCT_CLASS_MAIN_GLOBAL
       01  ans_getProduct  PIC S9(5).
       01  power_getProduct PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETPRODUCT_CLASS_MAIN_GLOBAL
       01  l2_getProduct   PIC S9(5).
       01  pwsd_getProduct PIC S9(5).
      * Variables for Scope:METHOD_GPWSD_CLASS_MAIN_GLOBAL
       01  b_gpwsd         PIC S9(5).
       01  n1_gpwsd        PIC S9(5).
       01  d2_gpwsd        PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GPWSD_CLASS_MAIN_GLOBAL
       01  ans_gpwsd       PIC S9(5).
       01  power_gpwsd     PIC S9(5).
       01  carry_gpwsd     PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GPWSD_CLASS_MAIN_GLOBAL
       01  l1_gpwsd        PIC S9(5).
       01  product_gpwsd   PIC S9(5).
       01  q_gpwsd         PIC S9(5).
       01  r_gpwsd         PIC S9(5).
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
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getProduct-PARA.
       MOVE 0 TO ans_getProduct
       MOVE 1 TO power_getProduct
       PERFORM UNTIL NOT (n2_getProduct NOT = 0)
       DIVIDE n2_getProduct BY 10 GIVING l2_getProduct REMAINDER l2_getProduct
       DIVIDE n2_getProduct BY 10 GIVING n2_getProduct
       MOVE gpwsd(b_getProduct, n1_getProduct, l2_getProduct) TO pwsd_getProduct
      * ans = ans +  (pwsd * power);
       MOVE getSum(b_getProduct, ans_getProduct, pwsd_getProduct * power_getProduct) TO ans_getProduct
       MULTIPLY power_getProduct BY 10 GIVING power_getProduct
       END-PERFORM
       EXIT.


       gpwsd-PARA.
       MOVE 0 TO ans_gpwsd
       MOVE 1 TO power_gpwsd
       MOVE 0 TO carry_gpwsd
       PERFORM UNTIL NOT (n1_gpwsd NOT = 0  OR  carry_gpwsd NOT = 0)
       DIVIDE n1_gpwsd BY 10 GIVING l1_gpwsd REMAINDER l1_gpwsd
       DIVIDE n1_gpwsd BY 10 GIVING n1_gpwsd
       COMPUTE TEMP_0 = l1_gpwsd * d2_gpwsd
       COMPUTE TEMP_1 = TEMP_0 + carry_gpwsd
       COMPUTE product_gpwsd = TEMP_1
       DIVIDE product_gpwsd BY b_gpwsd GIVING q_gpwsd
       DIVIDE product_gpwsd BY b_gpwsd GIVING r_gpwsd REMAINDER r_gpwsd
       COMPUTE TEMP_2 = r_gpwsd * power_gpwsd
       COMPUTE TEMP_3 = ans_gpwsd + TEMP_2
       COMPUTE ans_gpwsd = TEMP_3
       MOVE q_gpwsd TO carry_gpwsd
       MULTIPLY power_gpwsd BY 10 GIVING power_gpwsd
       END-PERFORM
       EXIT.


       getSum-PARA.
       MOVE 0 TO ans_getSum
       MOVE 0 TO carry_getSum
       MOVE 1 TO power_getSum
       PERFORM UNTIL NOT (n1_getSum > 0  OR  n2_getSum > 0  OR  carry_getSum > 0)
       DIVIDE n1_getSum BY 10 GIVING l1_getSum REMAINDER l1_getSum
       DIVIDE n2_getSum BY 10 GIVING l2_getSum REMAINDER l2_getSum
       DIVIDE n1_getSum BY 10 GIVING n1_getSum
       DIVIDE n2_getSum BY 10 GIVING n2_getSum
       COMPUTE TEMP_4 = l1_getSum + l2_getSum
       COMPUTE TEMP_5 = TEMP_4 + carry_getSum
       COMPUTE sum_getSum = TEMP_5
       DIVIDE sum_getSum BY b_getSum GIVING q_getSum
       DIVIDE sum_getSum BY b_getSum GIVING r_getSum REMAINDER r_getSum
       COMPUTE TEMP_6 = r_getSum * power_getSum
       COMPUTE TEMP_7 = ans_getSum + TEMP_6
       COMPUTE ans_getSum = TEMP_7
       MOVE q_getSum TO carry_getSum
       MULTIPLY power_getSum BY 10 GIVING power_getSum
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT b_main
       ACCEPT n1_main
       ACCEPT n2_main
       MOVE getProduct(b_main, n1_main, n2_main) TO d_main
       DISPLAY d_main
       EXIT.


