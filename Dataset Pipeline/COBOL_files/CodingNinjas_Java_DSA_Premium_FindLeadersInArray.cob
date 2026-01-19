       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FindLeadersInArray.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_LEADERS_CLASS_FINDLEADERSINARRAY_GLOBAL
       01  ARR_LEADERS_-ARRAY.
           05  arr_leaders  PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_LEADERS_CLASS_FINDLEADERSINARRAY_GLOBAL
       01  max_leaders     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_LEADERS_CLASS_FINDLEADERSINARRAY_GLOBAL
       01  i_leaders       PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_FINDLEADERSINARRAY_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FINDLEADERSINARRAY_GLOBAL
       01  ARR_MAIN_-ARRAY.
           05  arr_main     PIC S9(5) OCCURS 100 TIMES.
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       leaders-PARA.
       PERFORM VARYING i_leaders FROM arr_leaders BY -1 UNTIL NOT (i_leaders >= 0)
       COMPUTE TEMP_0 = length - 1
       COMPUTE i_leaders = TEMP_0
       IF arr_leaders[i_leaders] >= max_leaders
       MOVE arr_leaders(i_leaders + 1) TO TEMP_1
       DISPLAY TEMP_1 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       MOVE arr_leaders(i_leaders + 1) TO max_leaders
       END-IF
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * output 6 17
       MOVE arr_main TO arr_leaders
       PERFORM leaders-PARA
       EXIT.


