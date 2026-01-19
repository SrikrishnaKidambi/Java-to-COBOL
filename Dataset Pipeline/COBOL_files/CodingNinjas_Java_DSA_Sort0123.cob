       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Sort0123.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SORT012_CLASS_SORT012_GLOBAL
       01  ARR_SORT012_-ARRAY.
           05  arr_sort012  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SORT012_CLASS_SORT012_GLOBAL
       01  zero_sort012    PIC S9(5).
       01  one_sort012     PIC S9(5).
       01  two_sort012     PIC S9(5).
       01  i_sort012       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SORT012_CLASS_SORT012_GLOBAL
       01  i_sort012       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       sort012-PARA.
      * Your code goes here
       PERFORM VARYING i_sort012 FROM 0 BY 1 UNTIL NOT (i_sort012 < arr_sort012.length)
       IF arr_sort012[i_sort012] = 0
       ADD 1 TO zero_sort012
       ELSE
       IF arr_sort012[i_sort012] = 1
       ADD 1 TO one_sort012
       ELSE
       ADD 1 TO two_sort012
       END-IF
       END-IF
       END-PERFORM
       PERFORM UNTIL NOT (zero_sort012 > 0)
       COMPUTE arr_sort012(i_sort012 + 1) = 0
       SUBTRACT 1 FROM zero_sort012
       ADD 1 TO i_sort012
       END-PERFORM
       PERFORM UNTIL NOT (one_sort012 > 0)
       COMPUTE arr_sort012(i_sort012 + 1) = 1
       SUBTRACT 1 FROM one_sort012
       ADD 1 TO i_sort012
       END-PERFORM
       PERFORM UNTIL NOT (two_sort012 > 0)
       COMPUTE arr_sort012(i_sort012 + 1) = 2
       SUBTRACT 1 FROM two_sort012
       ADD 1 TO i_sort012
       END-PERFORM
       EXIT.


