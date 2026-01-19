       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Reverse Array.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  A_DISPLAY_-ARRAY.
           05  a_display    PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  sb_display      PIC X(100).
      * Variables for Scope:ENHANCEDFOR_FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  val_display     PIC S9(5).
      * Variables for Scope:METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  ARR_REVERSE_-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  left_reverse    PIC S9(5).
       01  right_reverse   PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  temp_reverse    PIC S9(5).
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
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       display-PARA.
       DISPLAY sb_display
       EXIT.


       reverse-PARA.
      * write your code here
       COMPUTE TEMP_0 = length - 1
       COMPUTE left_reverse = TEMP_0
       PERFORM UNTIL NOT (left_reverse < right_reverse)
       MOVE arr_reverse(left_reverse + 1) TO temp_reverse
       COMPUTE TEMP_1 = right_reverse + 1
       COMPUTE arr_reverse(left_reverse + 1) = TEMP_1
       COMPUTE arr_reverse(right_reverse + 1) = temp_reverse
       ADD 1 TO left_reverse
       SUBTRACT 1 FROM right_reverse
       END-PERFORM
       EXIT.


       MAIN-PARA.
       COMPUTE n_main = readLine
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       COMPUTE a_main(i_main + 1) = readLine
       END-PERFORM
       MOVE a_main TO arr_reverse
       PERFORM reverse-PARA
       MOVE a_main TO a_display
       PERFORM display-PARA
       EXIT.


