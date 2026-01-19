       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Matrix Multiplication.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n1_main         PIC S9(5).
       01  m1_main         PIC S9(5).
       01  arr1_main-ARRAY.
           05  arr1_main    PIC S9(5) OCCURS 11 TIMES.
       01  n2_main         PIC S9(5).
       01  m2_main         PIC S9(5).
       01  arr2_main-ARRAY.
           05  arr2_main    PIC S9(5) OCCURS 22 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  res_main-ARRAY .
           05  res_main     PIC S9(5) OCCURS 12 TIMES.
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  row_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  col_main        PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ans_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_FOR_BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  k_main          PIC S9(5).
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


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
      * Declaration & Initialization
       ACCEPT n1_main
       ACCEPT m1_main
      * INPUT: 1st
       COMPUTE TEMP_0 = n1_main - 1
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main <= TEMP_0)
       COMPUTE TEMP_1 = m1_main - 1
       PERFORM VARYING cols_main FROM 0 BY 1 UNTIL NOT (cols_main <= TEMP_1)
       ACCEPT arr1_main(rows_main + 1)[cols_main]
       COMPUTE TEMP_1 = m1_main - 1
       END-PERFORM
       COMPUTE TEMP_0 = n1_main - 1
       END-PERFORM
       ACCEPT n2_main
       ACCEPT m2_main
      * INPUT: 2nd
       COMPUTE TEMP_2 = n2_main - 1
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main <= TEMP_2)
       COMPUTE TEMP_3 = m2_main - 1
       PERFORM VARYING cols_main FROM 0 BY 1 UNTIL NOT (cols_main <= TEMP_3)
       ACCEPT arr2_main(rows_main + 1)[cols_main]
       COMPUTE TEMP_3 = m2_main - 1
       END-PERFORM
       COMPUTE TEMP_2 = n2_main - 1
       END-PERFORM
       IF m1_main = n2_main
       PERFORM VARYING row_main FROM 0 BY 1 UNTIL NOT (row_main < n1_main)
       PERFORM VARYING col_main FROM 0 BY 1 UNTIL NOT (col_main < m2_main)
      * C[row][col]
      * First matrix -> row, Second matrix -> col
       MOVE 0 TO ans_main
       PERFORM VARYING k_main FROM 0 BY 1 UNTIL NOT (k_main < m1_main)
      * or for(int k=0; k<n2; k++)
       COMPUTE TEMP_4 = row_main + 1
       COMPUTE TEMP_5 = k_main + 1
       COMPUTE TEMP_6 = TEMP_5 * col_main
       COMPUTE TEMP_7 = arr2_main + TEMP_6
       COMPUTE ans_main = TEMP_7
       END-PERFORM
       DISPLAY ans_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       ELSE
      * Matrix Multiplication not possible
       DISPLAY "Invalid input"
       END-IF
       EXIT.


