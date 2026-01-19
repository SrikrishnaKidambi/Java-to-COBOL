       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Rotate by 90 Degree.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN,N_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  cols_main       PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  temp_main       PIC S9(5).
      * Variables for Scope:METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  ARR_REVERSE_-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES.
       01  row_reverse     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  left_reverse    PIC S9(5).
       01  right_reverse   PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  temp_reverse    PIC S9(5).
      * Variables for Scope:METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  ARR_DISPLAY_-ARRAY.
           05  arr_display  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  i_display       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  j_display       PIC S9(5).
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


       reverse-PARA.
       COMPUTE TEMP_3 = row_reverse + 1
       COMPUTE TEMP_4 = length - 1
       COMPUTE left_reverse = TEMP_4
       PERFORM UNTIL NOT (left_reverse < right_reverse)
      * (row, left) & (row, right) Swap
       COMPUTE TEMP_5 = row_reverse + 1
       COMPUTE temp_reverse = left_reverse
       ADD 1 TO left_reverse
       SUBTRACT 1 FROM right_reverse
       END-PERFORM
       EXIT.


       display-PARA.
       PERFORM VARYING i_display FROM 0 BY 1 UNTIL NOT (i_display < arr_display.length)
       PERFORM VARYING j_display FROM 0 BY 1 UNTIL NOT (j_display < arr_display[0].length)
       COMPUTE TEMP_7 = i_display + 1
       COMPUTE TEMP_6 = j_display
       DISPLAY TEMP_6 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
      * Declaration & Initialization
       ACCEPT n_main
      * INPUT
       COMPUTE TEMP_0 = n_main - 1
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main <= TEMP_0)
       COMPUTE TEMP_1 = n_main - 1
       PERFORM VARYING cols_main FROM 0 BY 1 UNTIL NOT (cols_main <= TEMP_1)
       ACCEPT arr_main(rows_main + 1)[cols_main]
       COMPUTE TEMP_1 = n_main - 1
       END-PERFORM
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
      * Transpose
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main < n_main)
       PERFORM VARYING cols_main FROM rows_main BY 1 UNTIL NOT (cols_main < n_main)
       ADD rows_main TO 1 GIVING cols_main
      * Swap (cols, rows) & (rows, cols)
       COMPUTE TEMP_2 = rows_main + 1
       COMPUTE temp_main = cols_main
       END-PERFORM
       END-PERFORM
      * Row by Row Reverse
       PERFORM VARYING rows_main FROM 0 BY 1 UNTIL NOT (rows_main < n_main)
       PERFORM reverse-PARA
       END-PERFORM
       PERFORM display-PARA
       EXIT.


