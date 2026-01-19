       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_ParallelogramPattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PARALLELOGRAMPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PARALLELOGRAMPATTERN_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  colRows_main    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_PARALLELOGRAMPATTERN_GLOBAL
       01  spaces_main     PIC S9(5).
       01  stars_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO colRows_main
       PERFORM UNTIL NOT (colRows_main <= n_main)
       MOVE 1 TO spaces_main
       COMPUTE TEMP_0 = colRows_main - 1
       PERFORM UNTIL NOT (spaces_main <= TEMP_0)
       DISPLAY ' ' WITH NO ADVANCING
       ADD 1 TO spaces_main
       COMPUTE TEMP_0 = colRows_main - 1
       END-PERFORM
       MOVE 1 TO stars_main
       PERFORM UNTIL NOT (stars_main <= n_main)
       MOVE '*' TO TEMP_1
       DISPLAY TEMP_1 WITH NO ADVANCING
       ADD 1 TO stars_main
       END-PERFORM
       ADD 1 TO colRows_main
       END-PERFORM
       EXIT.


