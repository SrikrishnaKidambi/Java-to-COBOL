       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Swap.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SWAP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SWAP_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:METHOD_REVERSE_CLASS_SWAP_GLOBAL
       01  ARR_REVERSE_-ARRAY.
           05  arr_reverse  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_REVERSE_CLASS_SWAP_GLOBAL
       01  start_reverse   PIC S9(5).
       01  end_reverse     PIC S9(5).
      * Variables for Scope:METHOD_SWAP_CLASS_SWAP_GLOBAL
       01  ARR_SWAP_-ARRAY.
           05  arr_swap     PIC S9(5) OCCURS 100 TIMES.
       01  index1_swap     PIC S9(5).
       01  index2_swap     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_SWAP_CLASS_SWAP_GLOBAL
       01  temp_swap       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       reverse-PARA.
       MOVE 0 TO start_reverse
       COMPUTE TEMP_0 = length - 1
       COMPUTE end_reverse = TEMP_0
       PERFORM UNTIL NOT (start_reverse < end_reverse)
      * swap
       PERFORM swap-PARA
       ADD 1 TO start_reverse
       SUBTRACT 1 FROM end_reverse
       END-PERFORM
       EXIT.


       swap-PARA.
       MOVE arr_swap(index1_swap + 1) TO temp_swap
       COMPUTE TEMP_1 = index2_swap + 1
       COMPUTE arr_swap(index1_swap + 1) = TEMP_1
       COMPUTE arr_swap(index2_swap + 1) = temp_swap
       EXIT.


       MAIN-PARA.
      * swap(arr, 0, 4);
       PERFORM reverse-PARA
       DISPLAY Arrays.toString(arr_main)
       EXIT.


