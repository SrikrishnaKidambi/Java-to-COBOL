       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Saddle Price.


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
       01  isSaddlePtAchieved_main PIC X(1).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  j_main          PIC S9(5).
       01  k_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  Min_main        PIC S9(5).
       01  col_main        PIC S9(5).
       01  Max_main        PIC S9(5).
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
       MOVE 'N' TO isSaddlePtAchieved_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
      * Minimum of row i
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < n_main)
       IF arr_main[i_main][j_main] < MIn
       COMPUTE TEMP_0 = i_main + 1
       COMPUTE Min_main = j_main
       MOVE j_main TO col_main
       END-IF
       END-PERFORM
      * Maximum of col j
       PERFORM VARYING k_main FROM 0 BY 1 UNTIL NOT (k_main < n_main)
       IF arr_main[k_main][col_main] > Max_main
       COMPUTE TEMP_1 = k_main + 1
       COMPUTE Max_main = col_main
       END-IF
       END-PERFORM
      * Maximum Element == Minimum Element;
       IF Min_main = Max_main
       DISPLAY Min_main
       MOVE 'Y' TO isSaddlePtAchieved_main
       EXIT PERFORM
       END-IF
       END-PERFORM
       IF isSaddlePtAchieved_main = false
       DISPLAY "Invalid input"
       END-IF
       EXIT.


