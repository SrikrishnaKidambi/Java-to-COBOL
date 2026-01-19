       IDENTIFICATION DIVISION.
       PROGRAM-ID. Striver-A2Z-DSA-Sheet-Solution-using-JAVA_04_GcdOrHcf.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_GCD_CLASS_SOLUTION_GLOBAL
       01  a_gcd           PIC S9(5).
       01  b_gcd           PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GCD_CLASS_SOLUTION_GLOBAL
       01  rem_gcd         PIC S9(5).
      * Variables for Scope:METHOD_LCMANDGCD_CLASS_SOLUTION_GLOBAL
       01  A_lcmAndGcd     PIC S9(5).
       01  B_lcmAndGcd     PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_LCMANDGCD_CLASS_SOLUTION_GLOBAL
       01  gcd_lcmAndGcd   PIC S9(5).
       01  lcm_lcmAndGcd   PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       gcd-PARA.
      * Loop until remainder is zero
       PERFORM UNTIL NOT (b_gcd NOT = 0)
      * Calculate remainder of a divided by b
       DIVIDE a_gcd BY b_gcd GIVING rem_gcd REMAINDER rem_gcd
      * Assign b to a
       MOVE b_gcd TO a_gcd
      * Assign remainder to b
       MOVE rem_gcd TO b_gcd
       END-PERFORM
      * Return the GCD (when remainder is zero)
       EXIT.


       lcmAndGcd-PARA.
      * Compute the GCD of A and B
       MOVE gcd_lcmAndGcd(A_lcmAndGcd, B_lcmAndGcd) TO gcd_lcmAndGcd
      * Calculate LCM using the formula: LCM = (A * B) / GCD
       COMPUTE TEMP_0 = A_lcmAndGcd * B_lcmAndGcd
       COMPUTE TEMP_1 = TEMP_0 / gcd_lcmAndGcd
       COMPUTE lcm_lcmAndGcd = TEMP_1
      * Return the LCM and GCD as an array
       EXIT.


