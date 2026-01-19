       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_TotalSalary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TOTALSALARY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TOTALSALARY_GLOBAL
       01  s_main          PIC X(100).
       01  grade_main      PIC X(1).
       01  basic_main      PIC S9(5).
       01  allowance_main  PIC S9(5).
       01  totalSalary_main PIC S9(5).
       01  hra_main        PIC S9(5)V9(2).
       01  da_main         PIC S9(5)V9(2).
       01  pf_main         PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT grade_main
       ACCEPT basic_main
       COMPUTE TEMP_0 = 2 * basic_main
       COMPUTE hra_main = TEMP_0
       COMPUTE TEMP_1 = 5 * basic_main
       COMPUTE da_main = TEMP_1
       MOVE 1300 TO allowance_main
       IF grade_main = 'A'
       MOVE 1700 TO allowance_main
       ELSE
       IF grade_main = 'B'
       MOVE 1500 TO allowance_main
       ELSE
       MOVE 1300 TO allowance_main
       END-IF
       END-IF
       COMPUTE TEMP_2 = 11 * basic_main
       COMPUTE pf_main = TEMP_2
      * round is inbuilt Math function for rounding off numbers.
       COMPUTE TEMP_3 = basic_main + hra_main
       COMPUTE TEMP_4 = TEMP_3 + da_main
       COMPUTE TEMP_5 = TEMP_4 + allowance_main
       COMPUTE TEMP_6 = TEMP_5 - pf_main
       COMPUTE totalSalary_main = TEMP_6
       DISPLAY totalSalary_main
       EXIT.


