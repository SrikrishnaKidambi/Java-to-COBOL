       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ArrayLeaders.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_LEADERS_CLASS_ARRAYLEADERS_GLOBAL
       01  INPUT_LEADERS_-ARRAY.
           05  input_leaders PIC S9(5) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_LEADERS_CLASS_ARRAYLEADERS_GLOBAL
       01  i_leaders       PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_LEADERS_CLASS_ARRAYLEADERS_GLOBAL
       01  check_leaders   PIC X(1).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_LEADERS_CLASS_ARRAYLEADERS_GLOBAL
       01  j_leaders       PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       leaders-PARA.
       PERFORM VARYING i_leaders FROM 0 BY 1 UNTIL NOT (i_leaders < input_leaders.length)
       MOVE 'Y' TO check_leaders
       PERFORM VARYING j_leaders FROM i_leaders BY 1 UNTIL NOT (j_leaders < input_leaders.length)
       ADD i_leaders TO 1 GIVING j_leaders
       IF input_leaders[j_leaders] > input_leaders[i_leaders]
       MOVE 'N' TO check_leaders
       EXIT PERFORM
       END-IF
       END-PERFORM
       IF check_leaders = true
       MOVE input_leaders(i_leaders + 1) TO TEMP_0
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-IF
       END-PERFORM
       EXIT.


