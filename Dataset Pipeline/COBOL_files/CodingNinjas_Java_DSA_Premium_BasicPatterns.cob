       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_BasicPatterns.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_BASICPATTERNS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_BASICPATTERNS_GLOBAL
       01  s_main          PIC X(100).
       01  number_main     PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_BASICPATTERNS_GLOBAL
       01  cols_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT number_main
       MOVE 1 TO rows_main
       PERFORM UNTIL NOT (rows_main <= number_main)
      * reinitialize cols=1 for every row.
       MOVE 1 TO cols_main
       PERFORM UNTIL NOT (cols_main <= number_main)
       DISPLAY "*" WITH NO ADVANCING
       ADD 1 TO cols_main
       END-PERFORM
      * gives a new line at end of every row
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


