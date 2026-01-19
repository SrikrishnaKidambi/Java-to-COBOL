       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_GCD and LCM.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n1_main         PIC S9(5).
       01  n2_main         PIC S9(5).
       01  dvd_main        PIC S9(5).
       01  dsr_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  rem_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
       ACCEPT n1_main
       ACCEPT n2_main
       MOVE n1_main TO dvd_main
       MOVE n2_main TO dsr_main
       COMPUTE TEMP_0 = dvd_main % dsr_main
       PERFORM UNTIL NOT (TEMP_0 NOT = 0)
       DIVIDE dvd_main BY dsr_main GIVING rem_main REMAINDER rem_main
       MOVE dsr_main TO dvd_main
       MOVE rem_main TO dsr_main
       COMPUTE TEMP_0 = dvd_main % dsr_main
       END-PERFORM
       DISPLAY dsr_main
       COMPUTE TEMP_2 = n1_main * n2_main
       COMPUTE TEMP_3 = TEMP_2 / dsr_main
       COMPUTE TEMP_1 = TEMP_3
       DISPLAY TEMP_1
       EXIT.


