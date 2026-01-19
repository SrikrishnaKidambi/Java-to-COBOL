       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Print All Subsets - Iteration.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_DECIMALTOBINARY_CLASS_MAIN_GLOBAL
       01  dec_decimalToBinary PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_DECIMALTOBINARY_CLASS_MAIN_GLOBAL
       01  bin_decimalToBinary PIC S9(5).
       01  power_decimalToBinary PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_DECIMALTOBINARY_CLASS_MAIN_GLOBAL
       01  dig_decimalToBinary PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  br_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  A_MAIN_[SIZE=[N_MAIN]]-ARRAY.
           05  a_main       PIC S9(5) OCCURS 100 TIMES.
       01  totalSubsets_main PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
       01  dec_main        PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  binaryNo_main   PIC S9(5).
       01  div_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  quot_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       decimalToBinary-PARA.
       PERFORM UNTIL NOT (dec_decimalToBinary > 0)
       DIVIDE dec_decimalToBinary BY 2 GIVING dig_decimalToBinary REMAINDER dig_decimalToBinary
       DIVIDE dec_decimalToBinary BY 2 GIVING dec_decimalToBinary
       COMPUTE TEMP_0 = dig_decimalToBinary * power_decimalToBinary
       COMPUTE TEMP_1 = bin_decimalToBinary + TEMP_0
       COMPUTE bin_decimalToBinary = TEMP_1
       MULTIPLY power_decimalToBinary BY 10 GIVING power_decimalToBinary
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * write your code here
       COMPUTE n_main = readLine
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       COMPUTE a_main(i_main + 1) = readLine
       END-PERFORM
       COMPUTE totalSubsets_main = n_main
       PERFORM VARYING dec_main FROM 0 BY 1 UNTIL NOT (dec_main < totalSubsets_main)
       MOVE decimalToBinary(dec_main) TO binaryNo_main
      * System.out.println(binaryNo);
      * Subset
       COMPUTE TEMP_2 = n_main - 1
       COMPUTE div_main = TEMP_2
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < n_main)
       DIVIDE binaryNo_main BY div_main GIVING quot_main
       DIVIDE quot_main BY 10 GIVING TEMP_3 REMAINDER TEMP_3
       IF TEMP_3 = 0
       DISPLAY "-	" WITH NO ADVANCING
       ELSE
       MOVE a_main(i_main + 1) TO TEMP_4
       DISPLAY TEMP_4 WITH NO ADVANCING
       DISPLAY "	" WITH NO ADVANCING
       END-IF
       DIVIDE div_main BY 10 GIVING div_main
       END-PERFORM
       END-PERFORM
       EXIT.


