       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_CheckPermutation.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ISPERMUTATION_CLASS_CHECKPERMUTATION_GLOBAL
       01  input1_isPermutation PIC X(100).
       01  input2_isPermutation PIC X(100).
      * Variables for Scope:BLOCK_METHOD_ISPERMUTATION_CLASS_CHECKPERMUTATION_GLOBAL
       01  check_isPermutation PIC X(1).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_ISPERMUTATION_CLASS_CHECKPERMUTATION_GLOBAL
       01  count1_isPermutation PIC S9(5).
       01  count2_isPermutation PIC S9(5).
      * Variables for Scope:FOR_BLOCK_IF_BLOCK_METHOD_ISPERMUTATION_CLASS_CHECKPERMUTATION_GLOBAL
       01  i_isPermutation PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       isPermutation-PARA.
      * Write your code here
       MOVE 'N' TO check_isPermutation
       COMPUTE TEMP_0 = length
       IF TEMP_0 = input2_isPermutation.length()
       COMPUTE TEMP_1 = input1_isPermutation.length()
       PERFORM VARYING i_isPermutation FROM 0 BY 1 UNTIL NOT (i_isPermutation < TEMP_1)
       COMPUTE TEMP_2 = charAt + i_isPermutation
       COMPUTE count1_isPermutation = TEMP_2
       COMPUTE TEMP_3 = charAt + i_isPermutation
       COMPUTE count2_isPermutation = TEMP_3
       COMPUTE TEMP_1 = input1_isPermutation.length()
       END-PERFORM
       IF count1_isPermutation = count2_isPermutation
       MOVE 'Y' TO check_isPermutation
       END-IF
       END-IF
       EXIT.


