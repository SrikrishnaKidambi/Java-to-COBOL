       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_Return.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_RETURN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_RETURN_GLOBAL
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
       ADD 1 TO i_main
       IF i_main = 4
      * return will take out out of main loop, that is the calling function,
       GOBACK
       END-IF
       DISPLAY i_main
       END-PERFORM
       EXIT.


