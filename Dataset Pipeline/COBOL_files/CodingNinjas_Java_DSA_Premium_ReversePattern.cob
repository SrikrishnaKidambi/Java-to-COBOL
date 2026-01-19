       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_ReversePattern.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_REVERSEPATTERN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_REVERSEPATTERN_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_REVERSEPATTERN_GLOBAL
       01  cols_main       PIC S9(5).
       01  itemToPrint_main PIC S9(5).


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
       MOVE 1 TO cols_main
       MOVE n_main TO itemToPrint_main
       PERFORM UNTIL NOT (cols_main <= n_main)
      * you can also n-j+1 and it will n-cols+1
       DISPLAY itemToPrint_main WITH NO ADVANCING
       SUBTRACT 1 FROM itemToPrint_main
       ADD 1 TO cols_main
       END-PERFORM
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


