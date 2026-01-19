       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_RemoveConsecDuplicates.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_REMOVECONSECUTIVEDUPLICATES_CLASS_REMOVECONSECDUPLICATES_GLOBAL
       01  input_removeConsecutiveDuplicates PIC X(100).
      * Variables for Scope:BLOCK_METHOD_REMOVECONSECUTIVEDUPLICATES_CLASS_REMOVECONSECDUPLICATES_GLOBAL
       01  output_removeConsecutiveDuplicates PIC X(100).
       01  count_removeConsecutiveDuplicates PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_REMOVECONSECUTIVEDUPLICATES_CLASS_REMOVECONSECDUPLICATES_GLOBAL
       01  i_removeConsecutiveDuplicates PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_REMOVECONSECUTIVEDUPLICATES_CLASS_REMOVECONSECDUPLICATES_GLOBAL
       01  j_removeConsecutiveDuplicates PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       removeConsecutiveDuplicates-PARA.
      * Write your code here
       MOVE "" TO output_removeConsecutiveDuplicates
       COMPUTE TEMP_0 = input_removeConsecutiveDuplicates.length()
       PERFORM VARYING i_removeConsecutiveDuplicates FROM 0 BY 1 UNTIL NOT (i_removeConsecutiveDuplicates < TEMP_0)
       MOVE 1 TO count_removeConsecutiveDuplicates
       COMPUTE TEMP_1 = charAt + i_removeConsecutiveDuplicates
       COMPUTE output_removeConsecutiveDuplicates = TEMP_1
       COMPUTE TEMP_2 = input_removeConsecutiveDuplicates.length()
       PERFORM VARYING j_removeConsecutiveDuplicates FROM i_removeConsecutiveDuplicates BY 1 UNTIL NOT (j_removeConsecutiveDuplicates < TEMP_2)
       ADD i_removeConsecutiveDuplicates TO 1 GIVING j_removeConsecutiveDuplicates
       COMPUTE TEMP_3 = i_removeConsecutiveDuplicates
       IF TEMP_3 = input_removeConsecutiveDuplicates.charAt(j_removeConsecutiveDuplicates)
       ADD 1 TO count_removeConsecutiveDuplicates
       ELSE
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_2 = input_removeConsecutiveDuplicates.length()
       END-PERFORM
       COMPUTE TEMP_0 = input_removeConsecutiveDuplicates.length()
       END-PERFORM
       EXIT.


