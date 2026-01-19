       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_IsoscelesTrainglePattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ISOSCELESTRAINGLEPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ISOSCELESTRAINGLEPATTERN_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_ISOSCELESTRAINGLEPATTERN_GLOBAL
       01  numbers_main    PIC S9(5).
       01  spaces_main     PIC S9(5).
       01  dec_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


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
       MOVE 1 TO numbers_main
       MOVE 1 TO spaces_main
      * while loop for spaces
       COMPUTE TEMP_0 = n_main - rows_main
       PERFORM UNTIL NOT (spaces_main <= TEMP_0)
       DISPLAY ' ' WITH NO ADVANCING
       ADD 1 TO spaces_main
       COMPUTE TEMP_0 = n_main - rows_main
       END-PERFORM
      * while loop for increasing part
       PERFORM UNTIL NOT (numbers_main <= rows_main)
       DISPLAY numbers_main WITH NO ADVANCING
       ADD 1 TO numbers_main
       END-PERFORM
      * while loop for decreasing part
       SUBTRACT 1 FROM rows_main GIVING dec_main
       PERFORM UNTIL NOT (dec_main >= 1)
       DISPLAY dec_main WITH NO ADVANCING
       SUBTRACT 1 FROM dec_main
       END-PERFORM
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


