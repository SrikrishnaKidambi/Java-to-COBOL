       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_PushZeros.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PUSHZEROSATEND_CLASS_PUSHZEROS_GLOBAL
       01  ARR_PUSHZEROSATEND_-ARRAY.
           05  arr_pushZerosAtEnd PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_PUSHZEROSATEND_CLASS_PUSHZEROS_GLOBAL
       01  count_pushZerosAtEnd PIC S9(5).
       01  sumarr_pushZerosAtEnd PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_PUSHZEROSATEND_CLASS_PUSHZEROS_GLOBAL
       01  i_pushZerosAtEnd PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       pushZerosAtEnd-PARA.
      * Your code goes here
       PERFORM VARYING i_pushZerosAtEnd FROM 0 BY 1 UNTIL NOT (i_pushZerosAtEnd < arr_pushZerosAtEnd.length)
       IF arr_pushZerosAtEnd[i_pushZerosAtEnd] != 0
       COMPUTE TEMP_0 = i_pushZerosAtEnd + 1
       COMPUTE arr_pushZerosAtEnd(count_pushZerosAtEnd + + + 1) = TEMP_0
       END-IF
       END-PERFORM
       PERFORM UNTIL NOT (count_pushZerosAtEnd < arr_pushZerosAtEnd.length)
       COMPUTE arr_pushZerosAtEnd(count_pushZerosAtEnd + 1) = 0
       ADD 1 TO count_pushZerosAtEnd
       END-PERFORM
       EXIT.


