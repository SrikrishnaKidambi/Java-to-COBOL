       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_CheckArrayRotation.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ARRAYROTATECHECK_CLASS_CHECKARRAYROTATION_GLOBAL
       01  ARR_ARRAYROTATECHECK_-ARRAY.
           05  arr_arrayRotateCheck PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_ARRAYROTATECHECK_CLASS_CHECKARRAYROTATION_GLOBAL
       01  value_arrayRotateCheck PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_ARRAYROTATECHECK_CLASS_CHECKARRAYROTATION_GLOBAL
       01  i_arrayRotateCheck PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       arrayRotateCheck-PARA.
      * Your code goes here
       MOVE 0 TO value_arrayRotateCheck
       COMPUTE TEMP_0 = arr_arrayRotateCheck.length - 1
       PERFORM VARYING i_arrayRotateCheck FROM 0 BY 1 UNTIL NOT (i_arrayRotateCheck < TEMP_0)
       IF arr_arrayRotateCheck[i_arrayRotateCheck] > arr_arrayRotateCheck[i_arrayRotateCheck + 1]
       ADD i_arrayRotateCheck TO 1 GIVING value_arrayRotateCheck
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_0 = arr_arrayRotateCheck.length - 1
       END-PERFORM
       EXIT.


