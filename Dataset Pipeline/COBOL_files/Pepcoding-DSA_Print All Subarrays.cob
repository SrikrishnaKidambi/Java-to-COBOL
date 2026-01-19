       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Print All Subarrays.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  br_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  A_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  a_main       PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01  stpt_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  enpt_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
       COMPUTE n_main = readLine
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       COMPUTE a_main(i_main + 1) = readLine
       END-PERFORM
       PERFORM VARYING stpt_main FROM 0 BY 1 UNTIL NOT (stpt_main < n_main)
       PERFORM VARYING enpt_main FROM stpt_main BY 1 UNTIL NOT (enpt_main < n_main)
      * Starting Pt, Ending Pt
       PERFORM VARYING i_main FROM stpt_main BY 1 UNTIL NOT (i_main <= enpt_main)
      * Print Subarray
       MOVE a_main(i_main + 1) TO TEMP_0
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY "	" WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       END-PERFORM
       EXIT.


