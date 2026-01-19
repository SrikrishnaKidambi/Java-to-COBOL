       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SwapAlternate.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SWAPALTERNATE_CLASS_SWAPALTERNATE_GLOBAL
       01  ARR_SWAPALTERNATE_-ARRAY.
           05  arr_swapAlternate PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_SWAPALTERNATE_CLASS_SWAPALTERNATE_GLOBAL
       01  i_swapAlternate PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_SWAPALTERNATE_CLASS_SWAPALTERNATE_GLOBAL
       01  temp_swapAlternate PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       swapAlternate-PARA.
      * Your code goes here
       COMPUTE TEMP_0 = arr_swapAlternate.length - 1
       PERFORM VARYING i_swapAlternate FROM 0 BY 1 UNTIL NOT (i_swapAlternate < TEMP_0)
       MOVE arr_swapAlternate(i_swapAlternate + 1) TO temp_swapAlternate
       COMPUTE TEMP_1 = i_swapAlternate + 1
       COMPUTE TEMP_2 = TEMP_1 + 1
       COMPUTE arr_swapAlternate(i_swapAlternate + 1) = TEMP_2
       COMPUTE arr_swapAlternate(i_swapAlternate + 1 + 1) = temp_swapAlternate
       COMPUTE TEMP_0 = arr_swapAlternate.length - 1
       END-PERFORM
       EXIT.


