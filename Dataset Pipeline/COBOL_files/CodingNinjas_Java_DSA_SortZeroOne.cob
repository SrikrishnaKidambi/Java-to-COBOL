       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_SortZeroOne.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SORTZEROESANDONE_CLASS_SORTZEROONE_GLOBAL
       01  ARR_SORTZEROESANDONE_-ARRAY.
           05  arr_sortZeroesAndOne PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SORTZEROESANDONE_CLASS_SORTZEROONE_GLOBAL
       01  total_sortZeroesAndOne PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_SORTZEROESANDONE_CLASS_SORTZEROONE_GLOBAL
       01  i_sortZeroesAndOne PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       sortZeroesAndOne-PARA.
      * Your code goes here
       MOVE 0 TO total_sortZeroesAndOne
       PERFORM VARYING i_sortZeroesAndOne FROM 0 BY 1 UNTIL NOT (i_sortZeroesAndOne < arr_sortZeroesAndOne.length)
       COMPUTE TEMP_0 = i_sortZeroesAndOne + 1
       COMPUTE TEMP_1 = arr_sortZeroesAndOne + TEMP_0
       COMPUTE total_sortZeroesAndOne = TEMP_1
       END-PERFORM
       PERFORM VARYING i_sortZeroesAndOne FROM 0 BY 1 UNTIL NOT (i_sortZeroesAndOne < arr_sortZeroesAndOne.length)
       IF i_sortZeroesAndOne < arr_sortZeroesAndOne.length - total_sortZeroesAndOne
       COMPUTE arr_sortZeroesAndOne(i_sortZeroesAndOne + 1) = 0
       ELSE
       COMPUTE arr_sortZeroesAndOne(i_sortZeroesAndOne + 1) = 1
       END-IF
       END-PERFORM
       EXIT.


