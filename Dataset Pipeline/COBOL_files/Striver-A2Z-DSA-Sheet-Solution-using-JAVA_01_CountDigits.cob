       IDENTIFICATION DIVISION.
       PROGRAM-ID. Striver-A2Z-DSA-Sheet-Solution-using-JAVA_01_CountDigits.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_EVENLYDIVIDES_CLASS_SOLUTION_GLOBAL
       01  N_evenlyDivides PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_EVENLYDIVIDES_CLASS_SOLUTION_GLOBAL
       01  temp_evenlyDivides PIC S9(5).
       01  count_evenlyDivides PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_EVENLYDIVIDES_CLASS_SOLUTION_GLOBAL
       01  rem_evenlyDivides PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       evenlyDivides-PARA.
      * Initialize temporary variable with the original number
       MOVE N_evenlyDivides TO temp_evenlyDivides
      * Initialize counter for digits that evenly divide N
       MOVE 0 TO count_evenlyDivides
      * Loop through each digit of the number
       PERFORM UNTIL NOT (temp_evenlyDivides NOT = 0)
      * Get the last digit
       DIVIDE temp_evenlyDivides BY 10 GIVING rem_evenlyDivides REMAINDER rem_evenlyDivides
      * Check if remainder is not 0 and the digit divides the number evenly
       DIVIDE N_evenlyDivides BY rem_evenlyDivides GIVING TEMP_0 REMAINDER TEMP_0
       IF rem_evenlyDivides != 0  AND  TEMP_0 = 0
      * Increment count if it divides evenly
       ADD 1 TO count_evenlyDivides
       END-IF
      * Remove the last digit from the number
       DIVIDE temp_evenlyDivides BY 10 GIVING temp_evenlyDivides
       END-PERFORM
      * Return the count of digits that evenly divide the number
       EXIT.


