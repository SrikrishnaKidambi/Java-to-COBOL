       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_ArmstrongNum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ARMSTRONGNUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ARMSTRONGNUM_GLOBAL
       01  in_main         PIC X(100).
       01  n1_main         PIC S9(5).
       01  n2_main         PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_ARMSTRONGNUM_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_ARMSTRONGNUM_GLOBAL
       01  c_main          PIC S9(5).
       01  rem_main        PIC S9(5).
       01  sum_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n1_main
       ACCEPT n2_main
       PERFORM VARYING i_main FROM n1_main BY 1 UNTIL NOT (i_main < n2_main)
       PERFORM UNTIL NOT (c_main NOT = 0)
       DIVIDE c_main BY 10 GIVING rem_main REMAINDER rem_main
       COMPUTE TEMP_0 = rem_main * rem_main
       COMPUTE TEMP_1 = TEMP_0 * rem_main
       COMPUTE TEMP_2 = sum_main + TEMP_1
       COMPUTE sum_main = TEMP_2
       DIVIDE c_main BY 10 GIVING c_main
       END-PERFORM
       IF sum_main = i_main
       DISPLAY i_main
       DISPLAY " is an Armstrong Number"
       END-IF
       END-PERFORM
       EXIT.


