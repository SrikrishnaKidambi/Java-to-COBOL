       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program64_ArrayReversePrint.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM64_ARRAYREVERSEPRINT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM64_ARRAYREVERSEPRINT_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM64_ARRAYREVERSEPRINT_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       PERFORM VARYING i_main FROM arr_main BY -1 UNTIL NOT (i_main >= 0)
       COMPUTE TEMP_0 = length - 1
       COMPUTE i_main = TEMP_0
       MOVE arr_main(i_main + 1) TO TEMP_1
       DISPLAY TEMP_1
       END-PERFORM
       EXIT.


