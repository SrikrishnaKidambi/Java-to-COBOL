       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_Continue.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CONTINUE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CONTINUE_GLOBAL
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
       MOVE 5 TO n_main
       MOVE 1 TO i_main
       PERFORM UNTIL NOT (i_main <= n_main)
      * if you put i++ after continue it will result in infinite loop after 2 3 4 because continue will skip the current iteation and i++ will never occur.
       ADD 1 TO i_main
       IF i_main = 4
       END-IF
       DISPLAY i_main
       END-PERFORM
       EXIT.


