       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_State of Wakanda - II.


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
       01  i_main          PIC S9(5).
       01  gap_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01  row_main        PIC S9(5).
       01  col_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < n_main)
       ACCEPT arr_main(i_main + 1)[j_main]
       END-PERFORM
       END-PERFORM
       PERFORM VARYING gap_main FROM 0 BY 1 UNTIL NOT (gap_main < n_main)
      * gap = col - row
       PERFORM VARYING row_main FROM 0 BY 1 UNTIL NOT (col_main < n_main)
       COMPUTE TEMP_1 = row_main + 1
       COMPUTE TEMP_0 = col_main
       DISPLAY TEMP_0
       END-PERFORM
       END-PERFORM
       EXIT.


