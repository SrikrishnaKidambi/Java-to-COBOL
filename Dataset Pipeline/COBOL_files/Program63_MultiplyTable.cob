       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program63_MultiplyTable.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM63_MULTIPLYTABLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM63_MULTIPLYTABLE_GLOBAL
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM63_MULTIPLYTABLE_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM63_MULTIPLYTABLE_GLOBAL
       01  prod_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO n_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= 10)
       MULTIPLY n_main BY i_main GIVING prod_main
       DISPLAY n_main
       DISPLAY " * "
       DISPLAY i_main
       DISPLAY " = "
       DISPLAY prod_main
       END-PERFORM
       EXIT.


