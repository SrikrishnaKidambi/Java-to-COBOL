       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Bar Chart.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  ARR_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01  cols_main       PIC S9(5).
       01  max_main        PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
       ACCEPT n_main
       COMPUTE TEMP_0 = n_main - 1
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main <= TEMP_0)
       ACCEPT arr_main(i_main + 1)
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       IF arr_main[i_main] > max_main
       MOVE arr_main(i_main + 1) TO max_main
       END-IF
       END-PERFORM
       MOVE max_main TO rows_main
       PERFORM VARYING i_main FROM rows_main BY -1 UNTIL NOT (i_main > 0)
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < cols_main)
       IF i_main <= arr_main[j_main]
       DISPLAY "*	" WITH NO ADVANCING
       ELSE
       DISPLAY "	" WITH NO ADVANCING
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


