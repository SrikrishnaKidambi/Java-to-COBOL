       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_BasicPattern3.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_BASICPATTERN3_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_BASICPATTERN3_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_BASICPATTERN3_GLOBAL
       01  printValue_main PIC S9(5).
       01  cols_main       PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO rows_main
       PERFORM UNTIL NOT (rows_main <= n_main)
       MOVE rows_main TO printValue_main
       MOVE 1 TO cols_main
       PERFORM UNTIL NOT (cols_main <= rows_main)
       DISPLAY printValue_main WITH NO ADVANCING
       ADD 1 TO printValue_main
       ADD 1 TO cols_main
       END-PERFORM
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


