       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SumTwoArrays.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SUMOFTWOARRAYS_CLASS_SUMTWOARRAYS_GLOBAL
       01  ARR1_SUMOFTWOARRAYS_-ARRAY.
           05  arr1_sumOfTwoArrays PIC S9(5) OCCURS 100 TIMES.
       01  ARR2_SUMOFTWOARRAYS_-ARRAY.
           05  arr2_sumOfTwoArrays PIC S9(5) OCCURS 100 TIMES.
       01  OUTPUT_SUMOFTWOARRAYS_-ARRAY.
           05  output_sumOfTwoArrays PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SUMOFTWOARRAYS_CLASS_SUMTWOARRAYS_GLOBAL
       01  carry_sumOfTwoArrays PIC S9(5).
       01  val_sumOfTwoArrays PIC S9(5).
       01  k_sumOfTwoArrays PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SUMOFTWOARRAYS_CLASS_SUMTWOARRAYS_GLOBAL
       01  i_sumOfTwoArrays PIC S9(5).
       01  j_sumOfTwoArrays PIC S9(5).
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
       01 TEMP_10 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       sumOfTwoArrays-PARA.
      * Your code goes here
       COMPUTE TEMP_0 = length - 1
       COMPUTE carry_sumOfTwoArrays = TEMP_0
       PERFORM VARYING i_sumOfTwoArrays FROM arr1_sumOfTwoArrays BY -1 UNTIL NOT (i_sumOfTwoArrays >= 0  OR  j_sumOfTwoArrays >= 0)
       COMPUTE TEMP_1 = arr2_sumOfTwoArrays - length
       COMPUTE TEMP_2 = TEMP_1 - 1
       COMPUTE i_sumOfTwoArrays = TEMP_2
       IF i_sumOfTwoArrays >= 0  AND  j_sumOfTwoArrays >= 0
      * System.out.println("Adding digits at index " + i + " of arr1 and index " + j + " of arr2 and carry " + carry);
       COMPUTE TEMP_3 = i_sumOfTwoArrays + 1
       COMPUTE TEMP_4 = j_sumOfTwoArrays + 1
       COMPUTE TEMP_5 = arr2_sumOfTwoArrays + TEMP_4
       COMPUTE TEMP_6 = TEMP_5 + carry_sumOfTwoArrays
       COMPUTE val_sumOfTwoArrays = TEMP_6
      * System.out.println(val);
       IF val_sumOfTwoArrays > 9
      * System.out.println("Setting carry = 1 for next addition");
       SUBTRACT 10 FROM val_sumOfTwoArrays GIVING val_sumOfTwoArrays
       MOVE 1 TO carry_sumOfTwoArrays
       ELSE
      * System.out.println("Setting carry = 0 for next addition");
       MOVE 0 TO carry_sumOfTwoArrays
       END-IF
       ELSE
       IF i_sumOfTwoArrays >= 0
      * System.out.println("Adding digits at index " + i + " of arr1 and carry " + carry);
       COMPUTE TEMP_7 = i_sumOfTwoArrays + 1
       COMPUTE TEMP_8 = TEMP_7 + carry_sumOfTwoArrays
       COMPUTE val_sumOfTwoArrays = TEMP_8
      * System.out.println(val);
       IF val_sumOfTwoArrays > 9
      * System.out.println("Setting carry = 1 for next addition");
       SUBTRACT 10 FROM val_sumOfTwoArrays GIVING val_sumOfTwoArrays
       MOVE 1 TO carry_sumOfTwoArrays
       ELSE
      * System.out.println("Setting carry = 0 for next addition");
       MOVE 0 TO carry_sumOfTwoArrays
       END-IF
       ELSE
       IF j_sumOfTwoArrays >= 0
      * System.out.println("Adding digits at index " + j + " of arr2 and carry " + carry);
       COMPUTE TEMP_9 = i_sumOfTwoArrays + 1
       COMPUTE TEMP_10 = TEMP_9 + carry_sumOfTwoArrays
       COMPUTE val_sumOfTwoArrays = TEMP_10
      * System.out.println(val);
       IF val_sumOfTwoArrays > 9
      * System.out.println("Setting carry = 1 for next addition");
       SUBTRACT 10 FROM val_sumOfTwoArrays GIVING val_sumOfTwoArrays
       MOVE 1 TO carry_sumOfTwoArrays
       ELSE
      * System.out.println("Setting carry = 0 for next addition");
       MOVE 0 TO carry_sumOfTwoArrays
       END-IF
       END-IF
       END-IF
       END-IF
       COMPUTE output_sumOfTwoArrays(k_sumOfTwoArrays + 1) = val_sumOfTwoArrays
       SUBTRACT 1 FROM k_sumOfTwoArrays
       END-PERFORM
      * System.out.println("k = " + k);
       IF k_sumOfTwoArrays = 0
       COMPUTE output_sumOfTwoArrays(k_sumOfTwoArrays + 1) = carry_sumOfTwoArrays
       END-IF
       EXIT.


