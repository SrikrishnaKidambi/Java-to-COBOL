       IDENTIFICATION DIVISION.
       PROGRAM-ID. Striver-A2Z-DSA-Sheet-Solution-using-JAVA_02_ReverseANumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_REVERSE_CLASS_SOLUTION_GLOBAL
       01  x_reverse       PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_REVERSE_CLASS_SOLUTION_GLOBAL
       01  rev_reverse     PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_REVERSE_CLASS_SOLUTION_GLOBAL
       01  rem_reverse     PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       reverse-PARA.
      * Initialize variable to store the reversed number
       MOVE 0 TO rev_reverse
      * Loop until the original number becomes zero
       PERFORM UNTIL NOT (x_reverse NOT = 0)
      * Extract the last digit of the number
       DIVIDE x_reverse BY 10 GIVING rem_reverse REMAINDER rem_reverse
      * Check for potential overflow before multiplying
       IF rev_reverse > Integer.MAX_VALUE / 10  OR  rev_reverse < Integer.MIN_VALUE / 10
      * Return 0 if overflow would occur
       END-IF
      * Multiply the current reversed number by 10 and add the remainder
       COMPUTE TEMP_0 = rev_reverse * 10
       COMPUTE TEMP_1 = TEMP_0 + rem_reverse
       COMPUTE rev_reverse = TEMP_1
      * Remove the last digit from the original number
       DIVIDE x_reverse BY 10 GIVING x_reverse
       END-PERFORM
      * Return the reversed number
       EXIT.


