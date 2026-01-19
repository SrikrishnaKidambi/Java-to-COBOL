       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_23.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_23_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_23_GLOBAL
       01  input_main      PIC X(100).
       01  name_main       PIC X(100).
       01  hoursWorked_main PIC S9(5)V9(2).
       01  hourlyPayRate_main PIC S9(5)V9(2).
       01  federalTaxRate_main PIC S9(5)V9(2).
       01  stateTaxRate_main PIC S9(5)V9(2).
       01  grossPay_main   PIC S9(5)V9(2).
       01  federal_main    PIC S9(5)V9(2).
       01  state_main      PIC S9(5)V9(2).
       01  totalDeduction_main PIC S9(5)V9(2).
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


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter payroll inforation
       DISPLAY "Enter employee’s name: " WITH NO ADVANCING
       ACCEPT name_main
       DISPLAY "Enter number of hours worked in a week: " WITH NO ADVANCING
       ACCEPT hoursWorked_main
       DISPLAY "Enter hourly pay rate: " WITH NO ADVANCING
       ACCEPT hourlyPayRate_main
       DISPLAY "Enter federal tax withholding rate: " WITH NO ADVANCING
       ACCEPT federalTaxRate_main
       DISPLAY "Enter state tax withholding rate: " WITH NO ADVANCING
       ACCEPT stateTaxRate_main
      * Display payroll statement
       DISPLAY "Employee Name: " WITH NO ADVANCING
       DISPLAY name_main WITH NO ADVANCING
       DISPLAY "\nHours Worked: " WITH NO ADVANCING
       DISPLAY hoursWorked_main WITH NO ADVANCING
       DISPLAY "\nPay Rate: $" WITH NO ADVANCING
       DISPLAY hourlyPayRate_main WITH NO ADVANCING
       DISPLAY "\nGross Pay: $" WITH NO ADVANCING
       COMPUTE TEMP_1 = hoursWorked_main * hourlyPayRate_main
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY "\nDeductions:\n   Federal Witholding (20.0%): $" WITH NO ADVANCING
       COMPUTE TEMP_3 = grossPay_main * federalTaxRate_main
       COMPUTE TEMP_2 = TEMP_3
       DISPLAY TEMP_2 WITH NO ADVANCING
       DISPLAY "\n   State Witholding (9.0%): $" WITH NO ADVANCING
       COMPUTE TEMP_5 = grossPay_main * stateTaxRate_main
       COMPUTE TEMP_4 = TEMP_5
       DISPLAY TEMP_4 WITH NO ADVANCING
       DISPLAY "\n   Total Deduction: $" WITH NO ADVANCING
       COMPUTE TEMP_7 = federal_main + state_main
       COMPUTE TEMP_6 = TEMP_7
       DISPLAY TEMP_6 WITH NO ADVANCING
       DISPLAY "\nNet Pay: $" WITH NO ADVANCING
       COMPUTE TEMP_9 = grossPay_main - totalDeduction_main
       COMPUTE TEMP_8 = TEMP_9
       DISPLAY TEMP_8 WITH NO ADVANCING
       EXIT.


