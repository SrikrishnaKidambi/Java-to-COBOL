       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Exit Point of Matrix.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  m_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN,M_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  direction_main  PIC S9(5).
       01  row_main        PIC S9(5).
       01  col_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
      * Declaration & Initialization
       ACCEPT n_main
       ACCEPT m_main
      * INPUT
       COMPUTE TEMP_0 = n_main - 1
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main <= TEMP_0)
       COMPUTE TEMP_1 = m_main - 1
       PERFORM VARYING cols_main FROM 0 BY 1 UNTIL NOT (cols_main <= TEMP_1)
       ACCEPT arr_main(rows_main + 1)[cols_main]
       COMPUTE TEMP_1 = m_main - 1
       END-PERFORM
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
       PERFORM UNTIL NOT (row_main >= 0  AND  row_main < n_main  AND  col_main >= 0  AND  col_main < m_main)
      * Direction updation
       IF arr_main[row_main][col_main] = 1
       COMPUTE TEMP_2 = direction_main + 1
       DIVIDE TEMP_2 BY 4 GIVING TEMP_3 REMAINDER TEMP_4
       COMPUTE direction_main = TEMP_4
       END-IF
      * Move One Step
       IF direction_main = 0
       ADD 1 TO col_main
       ELSE
       IF direction_main = 1
       ADD 1 TO row_main
       ELSE
       IF direction_main = 2
       SUBTRACT 1 FROM col_main
      * North
       ELSE
       SUBTRACT 1 FROM row_main
       END-IF
       END-IF
       END-IF
       END-PERFORM
      * Report Exit Point
       IF direction_main = 0
       DISPLAY row_main
       SUBTRACT 1 FROM col_main GIVING TEMP_5
       DISPLAY TEMP_5
       ELSE
       IF direction_main = 1
       SUBTRACT 1 FROM row_main GIVING TEMP_6
       DISPLAY TEMP_6
       DISPLAY col_main
       ELSE
       IF direction_main = 2
       DISPLAY row_main
       DISPLAY col_main
       DISPLAY 1
       ELSE
       DISPLAY row_main
       DISPLAY 1
       DISPLAY col_main
       END-IF
       END-IF
       END-IF
       EXIT.


