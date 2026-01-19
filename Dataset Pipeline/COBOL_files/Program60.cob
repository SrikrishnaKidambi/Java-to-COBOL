       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program60.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM60_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM60_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  p_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM60_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 2 TO a_main
       MOVE 5 TO b_main
       MOVE 1 TO p_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= b_main)
       MULTIPLY p_main BY a_main GIVING p_main
       END-PERFORM
       DISPLAY p_main
       EXIT.


