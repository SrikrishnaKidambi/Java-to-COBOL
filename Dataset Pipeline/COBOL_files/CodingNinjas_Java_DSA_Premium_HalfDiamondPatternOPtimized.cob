       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_HalfDiamondPatternOPtimized.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_HALFDIAMONDPATTERNOPTIMIZED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_HALFDIAMONDPATTERNOPTIMIZED_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  currRow_main    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_HALFDIAMONDPATTERNOPTIMIZED_GLOBAL
       01  currCol_main    PIC S9(5).
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
      * for 1st star
       DISPLAY "*"
      * first half
       MOVE 1 TO currRow_main
       PERFORM UNTIL NOT (currRow_main <= n_main)
      * first star
       DISPLAY "*" WITH NO ADVANCING
       MOVE 1 TO currCol_main
      * for increasing numbers
       PERFORM UNTIL NOT (currCol_main <= currRow_main)
       DISPLAY currCol_main WITH NO ADVANCING
       ADD currCol_main TO 1 GIVING currCol_main
       END-PERFORM
      * for decreasing numbers
       SUBTRACT 2 FROM currCol_main GIVING currCol_main
       PERFORM UNTIL NOT (currCol_main >= 1)
       DISPLAY currCol_main WITH NO ADVANCING
       SUBTRACT 1 FROM currCol_main GIVING currCol_main
       END-PERFORM
       DISPLAY "*"
       ADD currRow_main TO 1 GIVING currRow_main
       END-PERFORM
      * for 2nd Half
       MOVE 1 TO currRow_main
       COMPUTE TEMP_0 = n_main - 1
       PERFORM UNTIL NOT (currRow_main <= TEMP_0)
       DISPLAY "*" WITH NO ADVANCING
       MOVE 1 TO currCol_main
      * for increasing numbers
       COMPUTE TEMP_1 = n_main - currRow_main
       PERFORM UNTIL NOT (currCol_main <= TEMP_1)
       DISPLAY currCol_main WITH NO ADVANCING
       ADD 1 TO currCol_main
       COMPUTE TEMP_1 = n_main - currRow_main
       END-PERFORM
      * for decreasing numbers
       SUBTRACT 2 FROM currCol_main GIVING currCol_main
       PERFORM UNTIL NOT (currCol_main >= 1)
       DISPLAY currCol_main WITH NO ADVANCING
       SUBTRACT 1 FROM currCol_main GIVING currCol_main
       END-PERFORM
       DISPLAY "*"
       ADD currRow_main TO 1 GIVING currRow_main
       COMPUTE TEMP_0 = n_main - 1
       END-PERFORM
       DISPLAY "*" WITH NO ADVANCING
       EXIT.


