       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_ProbabilityOfBalls.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FACTORIAL_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  n_factorial     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FACTORIAL_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  fact_factorial  PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_FACTORIAL_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  i_factorial     PIC S9(5).
      * Variables for Scope:METHOD_NCR_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  n_NCR           PIC S9(5).
       01  r_NCR           PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_NCR_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  factn_NCR       PIC S9(5).
       01  factr_NCR       PIC S9(5).
       01  factnr_NCR      PIC S9(5).
      * Variables for Scope:METHOD_PROBABILITY_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  n_probability   PIC S9(5).
       01  x_probability   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_PROBABILITY_CLASS_SOLUTION_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  favourableOutcome_probability PIC S9(5).
       01  totalOutcome_probability PIC S9(5).
       01  ans_probability PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROBABILITYOFBALLS_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  x_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       factorial-PARA.
       MOVE 1 TO fact_factorial
       PERFORM VARYING i_factorial FROM 1 BY 1 UNTIL NOT (i_factorial <= n_factorial)
       MULTIPLY fact_factorial BY i_factorial GIVING fact_factorial
       END-PERFORM
       EXIT.


       NCR-PARA.
       MOVE factorial(n_NCR) TO factn_NCR
       MOVE factorial(r_NCR) TO factr_NCR
       MOVE factorial(n_NCR - r_NCR) TO factnr_NCR
       EXIT.


       probability-PARA.
      * * Your class should be named Solution Don't write main(). Don't read input, it
			 * is passed as function argument. Return output and don't print it. Taking
			 * input and printing output is handled automatically.
       COMPUTE TEMP_0 = n_probability - x_probability
       COMPUTE TEMP_1 = 4 * TEMP_0
       COMPUTE favourableOutcome_probability = TEMP_1
       MOVE NCR(8, n_probability) TO totalOutcome_probability
       COMPUTE TEMP_2 = favourableOutcome_probability * 100
       COMPUTE TEMP_3 = TEMP_2 / totalOutcome_probability
       COMPUTE ans_probability = TEMP_3
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT x_main
       DISPLAY Solution.probability(n_main, x_main)
       EXIT.


