       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_TotalSalary.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TOTALSALARY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TOTALSALARY_GLOBAL
       01  scan_main       PIC X(100).
       01  basic_sal_main  PIC S9(5).
       01  grade_main      PIC S9(5).
       01  totalSalary_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT basic_sal_main
       COMPUTE TEMP_0 = 2 * basic_sal_main
       COMPUTE TEMP_1 = 0 + TEMP_0
       COMPUTE TEMP_2 = 5 * basic_sal_main
       COMPUTE TEMP_3 = 0 + TEMP_2
       COMPUTE TEMP_4 = 11 * basic_sal_main
       COMPUTE TEMP_5 = 0 - TEMP_4
       COMPUTE totalSalary_main = TEMP_5
       IF grade_main = 65
       ADD totalSalary_main TO 1700 GIVING totalSalary_main
       ELSE
       IF grade_main = 66
       ADD totalSalary_main TO 1500 GIVING totalSalary_main
       ELSE
       ADD totalSalary_main TO 1300 GIVING totalSalary_main
       END-IF
       END-IF
       DISPLAY Math.round(totalSalary_main)
       EXIT.


