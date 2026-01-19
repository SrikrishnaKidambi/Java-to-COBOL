<<<<<<< HEAD
=======
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
       01  b_main          PIC S9(5).
       01  i_main          PIC S9(5).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 2 TO a_main
       MOVE 3 TO b_main
       MOVE 0 TO i_main
       MOVE 0 TO n_main
       COMPUTE TEMP_0 = a_main + b_main
       PERFORM UNTIL NOT (i_main < TEMP_0)
       COMPUTE TEMP_1 = n_main + 2
       PERFORM VARYING j_main FROM 0 BY 1 UNTIL NOT (j_main < TEMP_1)
       ADD 1 TO a_main
       ADD 1 TO i_main
       COMPUTE TEMP_1 = n_main + 2
       END-PERFORM
       COMPUTE TEMP_0 = a_main + b_main
       END-PERFORM
       EXIT.


>>>>>>> 28b8c928417ac931a4bf3d5a3b0f39cef431571d
