       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Span of Array.


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
       01  min_main        PIC S9(5).
       01  max_main        PIC S9(5).
       01  span_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  curr_val_main   PIC S9(5).
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
       MOVE arr_main(i_main + 1) TO curr_val_main
       IF curr_val_main < min_main
       MOVE curr_val_main TO min_main
       END-IF
       IF curr_val_main > max_main
       MOVE curr_val_main TO max_main
       END-IF
       END-PERFORM
       SUBTRACT min_main FROM max_main GIVING span_main
       DISPLAY span_main WITH NO ADVANCING
       EXIT.


