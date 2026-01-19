       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_TripletSum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_FINDTRIPLET_CLASS_TRIPLETSUM_GLOBAL
       01  ARR_FINDTRIPLET_-ARRAY.
           05  arr_findTriplet PIC S9(5) OCCURS 100 TIMES.
       01  x_findTriplet   PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_FINDTRIPLET_CLASS_TRIPLETSUM_GLOBAL
       01  count_findTriplet PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_FINDTRIPLET_CLASS_TRIPLETSUM_GLOBAL
       01  i_findTriplet   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_FINDTRIPLET_CLASS_TRIPLETSUM_GLOBAL
       01  j_findTriplet   PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_FOR_BLOCK_METHOD_FINDTRIPLET_CLASS_TRIPLETSUM_GLOBAL
       01  k_findTriplet   PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       findTriplet-PARA.
      * Your code goes here
       MOVE 0 TO count_findTriplet
       COMPUTE TEMP_0 = arr_findTriplet.length - 2
       PERFORM VARYING i_findTriplet FROM 0 BY 1 UNTIL NOT (i_findTriplet < TEMP_0)
       COMPUTE TEMP_1 = arr_findTriplet.length - 1
       PERFORM VARYING j_findTriplet FROM i_findTriplet BY 1 UNTIL NOT (j_findTriplet < TEMP_1)
       ADD i_findTriplet TO 1 GIVING j_findTriplet
       PERFORM VARYING k_findTriplet FROM j_findTriplet BY 1 UNTIL NOT (k_findTriplet < arr_findTriplet.length)
       ADD j_findTriplet TO 1 GIVING k_findTriplet
       COMPUTE TEMP_3 = i_findTriplet + 1
       COMPUTE TEMP_4 = j_findTriplet + 1
       COMPUTE TEMP_5 = arr_findTriplet + TEMP_4
       COMPUTE TEMP_6 = k_findTriplet + 1
       COMPUTE TEMP_7 = arr_findTriplet + TEMP_6
       COMPUTE TEMP_2 = TEMP_7
       IF TEMP_2 = x_findTriplet
       ADD 1 TO count_findTriplet
       END-IF
       END-PERFORM
       COMPUTE TEMP_1 = arr_findTriplet.length - 1
       END-PERFORM
       COMPUTE TEMP_0 = arr_findTriplet.length - 2
       END-PERFORM
       PERFORM return-PARA
       EXIT.


