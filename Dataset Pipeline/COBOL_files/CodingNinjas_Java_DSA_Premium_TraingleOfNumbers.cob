       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_TraingleOfNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TRAINGLEOFNUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TRAINGLEOFNUMBERS_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TRAINGLEOFNUMBERS_GLOBAL
       01  spaces_main     PIC S9(5).
       01  increasing_main PIC S9(5).
       01  printValueLeft_main PIC S9(5).
       01  decreasing_main PIC S9(5).
       01  printValueRight_main PIC S9(5).
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
       MOVE 1 TO spaces_main
      * 1st loop for spaces
       COMPUTE TEMP_0 = n_main - rows_main
       PERFORM UNTIL NOT (spaces_main <= TEMP_0)
       DISPLAY ' ' WITH NO ADVANCING
       ADD 1 TO spaces_main
       COMPUTE TEMP_0 = n_main - rows_main
       END-PERFORM
      * 2nd increasing loop
       MOVE 1 TO increasing_main
       MOVE rows_main TO printValueLeft_main
       PERFORM UNTIL NOT (increasing_main <= rows_main)
       DISPLAY printValueLeft_main WITH NO ADVANCING
       ADD 1 TO printValueLeft_main
       ADD 1 TO increasing_main
       END-PERFORM
      * 3rd decreasing loop
       SUBTRACT 1 FROM rows_main GIVING decreasing_main
       SUBTRACT 2 FROM printValueLeft_main GIVING printValueRight_main
       PERFORM UNTIL NOT (decreasing_main >= 1)
       DISPLAY printValueRight_main WITH NO ADVANCING
       SUBTRACT 1 FROM printValueRight_main
       SUBTRACT 1 FROM decreasing_main
       END-PERFORM
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


