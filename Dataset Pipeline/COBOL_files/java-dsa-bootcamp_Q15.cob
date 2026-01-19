       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q15.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:CLASS_Q15_GLOBAL
       01  input           PIC X(100).
      * Variables for Scope:METHOD_MAIN_CLASS_Q15_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q15_GLOBAL
       01  num_main        PIC S9(5).
      * Variables for Scope:METHOD_ARMSTRONG_CHECK_CLASS_Q15_GLOBAL
       01  n_armstrong_check PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ARMSTRONG_CHECK_CLASS_Q15_GLOBAL
       01  temp_armstrong_check PIC S9(5).
       01  rem_armstrong_check PIC S9(5).
       01  result_armstrong_check PIC S9(5).
       01  power_armstrong_check PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       armstrong_check-PARA.
       COMPUTE power_armstrong_check = length
       PERFORM UNTIL NOT (temp_armstrong_check NOT = 0)
       DIVIDE temp_armstrong_check BY 10 GIVING rem_armstrong_check REMAINDER rem_armstrong_check
       COMPUTE TEMP_0 = rem_armstrong_check + power_armstrong_check
       COMPUTE result_armstrong_check = TEMP_0
       DIVIDE temp_armstrong_check BY 10 GIVING temp_armstrong_check
       END-PERFORM
       IF result_armstrong_check = n_armstrong_check
       ELSE
       END-IF
       EXIT.


       MAIN-PARA.
       DISPLAY "This program checks whether the entered number is armstrong or not."
       PERFORM UNTIL NOT (true)
       DISPLAY "Enter a positive integer (0 to exit) : " WITH NO ADVANCING
       ACCEPT num_main
       IF num_main = 0
       STOP RUN
       ELSE
       IF armstrong_check(num_main)
       DISPLAY "Yes, It is a armstrong number."
       ELSE
       DISPLAY "No, It is not a armstrong number."
       END-IF
       END-IF
       END-PERFORM
       EXIT.


