       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_RotateArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ROTATE_CLASS_ROTATEARRAY_GLOBAL
       01  ARR_ROTATE_-ARRAY.
           05  arr_rotate   PIC S9(5) OCCURS 100 TIMES.
       01  d_rotate        PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ROTATE_CLASS_ROTATEARRAY_GLOBAL
       01  TEMP_ROTATE_[SIZE=[D_ROTATE]]-ARRAY.
           05  temp_rotate  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_ROTATE_CLASS_ROTATEARRAY_GLOBAL
       01  i_rotate        PIC S9(5).
       01  j_rotate        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       rotate-PARA.
      * Your code goes here
       PERFORM VARYING i_rotate FROM 0 BY 1 UNTIL NOT (i_rotate < d_rotate)
       COMPUTE TEMP_0 = i_rotate + 1
       COMPUTE temp_rotate(i_rotate + 1) = TEMP_0
       END-PERFORM
      * System.out.println();
       PERFORM VARYING i_rotate FROM 0 BY 1 UNTIL NOT (i_rotate < arr_rotate.length  AND  j_rotate < d_rotate)
       IF i_rotate < arr_rotate.length - d_rotate
       COMPUTE TEMP_1 = i_rotate + d_rotate
       COMPUTE TEMP_2 = TEMP_1 + 1
       COMPUTE arr_rotate(i_rotate + 1) = TEMP_2
       ELSE
       COMPUTE TEMP_3 = j_rotate + 1
       COMPUTE arr_rotate(i_rotate + 1) = TEMP_3
       ADD 1 TO j_rotate
       END-IF
       END-PERFORM
       EXIT.


