       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Rotate Array.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  A_DISPLAY_-ARRAY.
           05  a_display    PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  sb_display      PIC X(100).
      * Variables for Scope:ENHANCEDFOR_FOR_BLOCK_METHOD_DISPLAY_CLASS_MAIN_GLOBAL
       01  val_display     PIC S9(5).
      * Variables for Scope:METHOD_SWAP_CLASS_MAIN_GLOBAL
       01  ARR_SWAP_-ARRAY.
           05  arr_swap     PIC S9(5) OCCURS 100 TIMES.
       01  left_swap       PIC S9(5).
       01  right_swap      PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_SWAP_CLASS_MAIN_GLOBAL
       01  temp_swap       PIC S9(5).
      * Variables for Scope:METHOD_REVERSE_CLASS_MAIN_GLOBAL
       01  ARR_REVERSE_-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES.
       01  left_reverse    PIC S9(5).
       01  right_reverse   PIC S9(5).
      * Variables for Scope:METHOD_ROTATE_CLASS_MAIN_GLOBAL
       01  A_ROTATE_-ARRAY.
           05  a_rotate     PIC S9(5) OCCURS 100 TIMES.
       01  k_rotate        PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ROTATE_CLASS_MAIN_GLOBAL
       01  n_rotate        PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  br_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  A_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  a_main       PIC S9(5) OCCURS 100 TIMES.
       01  k_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       display-PARA.
       DISPLAY sb_display
       EXIT.


       swap-PARA.
       MOVE arr_swap(left_swap + 1) TO temp_swap
       COMPUTE TEMP_0 = right_swap + 1
       COMPUTE arr_swap(left_swap + 1) = TEMP_0
       COMPUTE arr_swap(right_swap + 1) = temp_swap
       EXIT.


       reverse-PARA.
       PERFORM UNTIL NOT (left_reverse < right_reverse)
       MOVE arr_reverse TO arr_swap
       MOVE left_reverse TO left_swap
       MOVE right_reverse TO right_swap
       PERFORM swap-PARA
       ADD 1 TO left_reverse
       SUBTRACT 1 FROM right_reverse
       END-PERFORM
       EXIT.


       rotate-PARA.
      * write your code here
       DIVIDE k_rotate BY n_rotate GIVING TEMP_1 REMAINDER TEMP_2
       COMPUTE TEMP_3 = TEMP_2 + n_rotate
       DIVIDE TEMP_3 BY n_rotate GIVING TEMP_4 REMAINDER TEMP_5
       COMPUTE k_rotate = TEMP_5
      * First n-k elements
       MOVE a_rotate TO arr_reverse
       MOVE 0 TO left_reverse
       COMPUTE TEMP_7 = n_rotate - k_rotate
       COMPUTE TEMP_8 = TEMP_7 - 1
       COMPUTE TEMP_6 = TEMP_8
       MOVE TEMP_6 TO right_reverse
       PERFORM reverse-PARA
      * Last k elements
       MOVE a_rotate TO arr_reverse
       SUBTRACT k_rotate FROM n_rotate GIVING TEMP_9
       MOVE TEMP_9 TO left_reverse
       SUBTRACT 1 FROM n_rotate GIVING TEMP_10
       MOVE TEMP_10 TO right_reverse
       PERFORM reverse-PARA
      * Whole array
       MOVE a_rotate TO arr_reverse
       MOVE 0 TO left_reverse
       SUBTRACT 1 FROM n_rotate GIVING TEMP_11
       MOVE TEMP_11 TO right_reverse
       PERFORM reverse-PARA
       EXIT.


       MAIN-PARA.
       COMPUTE n_main = readLine
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       COMPUTE a_main(i_main + 1) = readLine
       END-PERFORM
       COMPUTE k_main = readLine
       MOVE a_main TO a_rotate
       MOVE k_main TO k_rotate
       PERFORM rotate-PARA
       MOVE a_main TO a_display
       PERFORM display-PARA
       EXIT.


