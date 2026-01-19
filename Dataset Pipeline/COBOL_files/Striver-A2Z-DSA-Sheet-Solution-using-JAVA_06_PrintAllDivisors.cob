       IDENTIFICATION DIVISION.
       PROGRAM-ID. Striver-A2Z-DSA-Sheet-Solution-using-JAVA_06_PrintAllDivisors.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SUMOFDIVISORS_CLASS_SOLUTION_GLOBAL
       01  N_sumOfDivisors PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_SUMOFDIVISORS_CLASS_SOLUTION_GLOBAL
       01  sum_sumOfDivisors PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUMOFDIVISORS_CLASS_SOLUTION_GLOBAL
       01  i_sumOfDivisors PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       sumOfDivisors-PARA.
      * Initialize the variable to store the total sum of divisors
       MOVE 0 TO sum_sumOfDivisors
      * Loop through each integer from 1 to N
       PERFORM VARYING i_sumOfDivisors FROM 1 BY 1 UNTIL NOT (i_sumOfDivisors <= N_sumOfDivisors)
      * Add the product of i and the number of multiples of i up to N
       COMPUTE TEMP_0 = N_sumOfDivisors / i_sumOfDivisors
       COMPUTE TEMP_1 = i_sumOfDivisors * TEMP_0
       COMPUTE TEMP_2 = sum_sumOfDivisors + TEMP_1
       COMPUTE sum_sumOfDivisors = TEMP_2
       END-PERFORM
      * Return the total sum of all divisors
       EXIT.


