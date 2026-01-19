       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Difference of 2 Arrays.


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
       01  borrow_main     PIC S9(5).
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  dig1_main       PIC S9(5).
       01  dig2_main       PIC S9(5).
       01  diff_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


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
       MOVE n2_main TO n3_main
       MOVE 0 TO borrow_main
       PERFORM UNTIL NOT (i3_main >= 0)
       COMPUTE TEMP_0 = i1_main + 1
       COMPUTE dig1_main = 0
       COMPUTE TEMP_1 = i2_main + 1
       COMPUTE dig2_main = 0
       COMPUTE TEMP_2 = dig2_main - borrow_main
       COMPUTE TEMP_3 = TEMP_2 - dig1_main
       COMPUTE diff_main = TEMP_3
       IF diff_main < 0
       ADD diff_main TO 10 GIVING diff_main
       MOVE 1 TO borrow_main
       ELSE
       MOVE 0 TO borrow_main
       END-IF
       COMPUTE arr3_main(i3_main + 1) = diff_main
       SUBTRACT 1 FROM i1_main
       SUBTRACT 1 FROM i2_main
       SUBTRACT 1 FROM i3_main
       END-PERFORM
       PERFORM UNTIL NOT (arr3_main[i_main] = 0)
       ADD 1 TO i_main
       END-PERFORM
       MOVE arr3_main(i_main + 1) TO TEMP_4
       DISPLAY TEMP_4
       EXIT.


