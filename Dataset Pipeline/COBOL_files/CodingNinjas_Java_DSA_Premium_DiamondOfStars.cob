       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_DiamondOfStars.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_DIAMONDOFSTARS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_DIAMONDOFSTARS_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  firstHalf_main  PIC S9(5).
       01  secondHalf_main PIC S9(5).
       01  currRow_main    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_DIAMONDOFSTARS_GLOBAL
       01  spaces_main     PIC S9(5).
       01  currCol_main    PIC S9(5).
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


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       COMPUTE TEMP_0 = n_main + 1
       COMPUTE TEMP_1 = TEMP_0 / 2
       COMPUTE firstHalf_main = TEMP_1
       SUBTRACT firstHalf_main FROM n_main GIVING secondHalf_main
      * for 1st half
       MOVE 1 TO currRow_main
       PERFORM UNTIL NOT (currRow_main <= firstHalf_main)
      * for spaces
       MOVE 1 TO spaces_main
       COMPUTE TEMP_2 = firstHalf_main - currRow_main
       PERFORM UNTIL NOT (spaces_main <= TEMP_2)
       DISPLAY ' ' WITH NO ADVANCING
       ADD 1 TO spaces_main
       COMPUTE TEMP_2 = firstHalf_main - currRow_main
       END-PERFORM
      * for stars
       MOVE 1 TO currCol_main
       COMPUTE TEMP_3 = 2 * currRow_main - 1
       PERFORM UNTIL NOT (currCol_main <= TEMP_3)
       MOVE '*' TO TEMP_4
       DISPLAY TEMP_4 WITH NO ADVANCING
       ADD 1 TO currCol_main
       COMPUTE TEMP_3 = 2 * currRow_main - 1
       END-PERFORM
       ADD 1 TO currRow_main
       END-PERFORM
       MOVE secondHalf_main TO currRow_main
      * for 2nd half
       PERFORM UNTIL NOT (currRow_main >= 1)
      * for spaces
       MOVE 1 TO spaces_main
       COMPUTE TEMP_5 = secondHalf_main - currRow_main + 1
       PERFORM UNTIL NOT (spaces_main <= TEMP_5)
       DISPLAY ' ' WITH NO ADVANCING
       ADD 1 TO spaces_main
       COMPUTE TEMP_5 = secondHalf_main - currRow_main + 1
       END-PERFORM
      * for stars
       MOVE 1 TO currCol_main
       COMPUTE TEMP_6 = 2 * currRow_main - 1
       PERFORM UNTIL NOT (currCol_main <= TEMP_6)
       MOVE '*' TO TEMP_7
       DISPLAY TEMP_7 WITH NO ADVANCING
       ADD 1 TO currCol_main
       COMPUTE TEMP_6 = 2 * currRow_main - 1
       END-PERFORM
       SUBTRACT 1 FROM currRow_main
       END-PERFORM
       EXIT.


