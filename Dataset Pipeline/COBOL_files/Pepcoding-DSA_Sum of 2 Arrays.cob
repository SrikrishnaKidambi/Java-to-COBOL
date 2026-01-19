       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Sum of 2 Arrays.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n1_main         PIC S9(5).
       01  arr1_main-ARRAY.
           05  arr1_main    PIC S9(5) OCCURS 1 TIMES.
       01  n2_main         PIC S9(5).
       01  arr2_main-ARRAY.
           05  arr2_main    PIC S9(5) OCCURS 2 TIMES.
       01  n3_main         PIC S9(5).
       01  arr3_main-ARRAY.
           05  arr3_main    PIC S9(5) OCCURS 3 TIMES.
       01  i1_main         PIC S9(5).
       01  i2_main         PIC S9(5).
       01  i3_main         PIC S9(5).
       01  carry_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  dig1_main       PIC S9(5).
       01  dig2_main       PIC S9(5).
       01  sum_main        PIC S9(5).
       01  quot_main       PIC S9(5).
       01  rem_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
       ACCEPT n1_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n1_main)
       ACCEPT arr1_main(i_main + 1)
       END-PERFORM
       ACCEPT n2_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n2_main)
       ACCEPT arr2_main(i_main + 1)
       END-PERFORM
       COMPUTE TEMP_0 = n2_main + 1
       COMPUTE n3_main = TEMP_0
       MOVE 0 TO carry_main
       PERFORM UNTIL NOT (i3_main >= 0)
      * int sum = (n1 % 10) + (n2 % 10) + carry;
       COMPUTE TEMP_1 = i1_main + 1
       COMPUTE dig1_main = 0
       COMPUTE TEMP_2 = i2_main + 1
       COMPUTE dig2_main = 0
       COMPUTE TEMP_3 = dig1_main + dig2_main
       COMPUTE TEMP_4 = TEMP_3 + carry_main
       COMPUTE sum_main = TEMP_4
       DIVIDE sum_main BY 10 GIVING quot_main
       DIVIDE sum_main BY 10 GIVING rem_main REMAINDER rem_main
       COMPUTE arr3_main(i3_main + 1) = rem_main
       MOVE quot_main TO carry_main
       SUBTRACT 1 FROM i1_main
       SUBTRACT 1 FROM i2_main
       SUBTRACT 1 FROM i3_main
       END-PERFORM
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < arr3_main.length)
       IF i_main = 0  AND  arr3_main[i_main] = 0
       ELSE
       MOVE arr3_main(i_main + 1) TO TEMP_5
       DISPLAY TEMP_5
       END-IF
       END-PERFORM
       EXIT.


