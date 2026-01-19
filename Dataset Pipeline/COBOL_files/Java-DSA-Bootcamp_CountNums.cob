       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_CountNums.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_COUNTNUMS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_COUNTNUMS_GLOBAL
       01  n_main          PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_COUNTNUMS_GLOBAL
       01  rem_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 45535 TO n_main
       MOVE 0 TO count_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 10 GIVING rem_main REMAINDER rem_main
       IF rem_main = 5
       ADD 1 TO count_main
       END-IF
      * n /= 10
       DIVIDE n_main BY 10 GIVING n_main
       END-PERFORM
       DISPLAY count_main
       EXIT.


