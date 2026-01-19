       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ArrayIntersection.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_INTERSECTIONS_CLASS_ARRAYINTERSECTION_GLOBAL
       01  ARR1_INTERSECTIONS_-ARRAY.
           05  arr1_intersections PIC S9(5) OCCURS 100 TIMES.
       01  ARR2_INTERSECTIONS_-ARRAY.
           05  arr2_intersections PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_INTERSECTIONS_CLASS_ARRAYINTERSECTION_GLOBAL
       01  n1_intersections PIC S9(5).
       01  n2_intersections PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_INTERSECTIONS_CLASS_ARRAYINTERSECTION_GLOBAL
       01  i_intersections PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_INTERSECTIONS_CLASS_ARRAYINTERSECTION_GLOBAL
       01  j_intersections PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       intersections-PARA.
       PERFORM VARYING i_intersections FROM 0 BY 1 UNTIL NOT (i_intersections < n1_intersections)
       PERFORM VARYING j_intersections FROM 0 BY 1 UNTIL NOT (j_intersections < n2_intersections)
       IF arr1_intersections[i_intersections] = arr2_intersections[j_intersections]
       MOVE arr1_intersections(i_intersections + 1) TO TEMP_0
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       COMPUTE arr2_intersections(j_intersections + 1) = MIN_VALUE
       EXIT PERFORM
       END-IF
       END-PERFORM
       END-PERFORM
       EXIT.


