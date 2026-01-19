       IDENTIFICATION DIVISION.
<<<<<<< HEAD
       PROGRAM-ID. TestArgsExpr.
=======
       PROGRAM-ID. Test.
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_CHECK_CLASS_TESTSCOPED_GLOBAL
       01  x_check         PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  p_main          PIC S9(5).
       01  q_main          PIC S9(5).
       01  r_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
<<<<<<< HEAD
=======
       01 TEMP_2 PIC S9(9).
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


<<<<<<< HEAD
       check-PARA.
       COMPUTE TEMP_0 = x_check + 2 * 3
       IF TEMP_0 > 10
       DISPLAY "BIG"
       ELSE
       DISPLAY "SMALL"
       END-IF
       EXIT.


       MAIN-PARA.
       MOVE 2 TO p_main
       MOVE 4 TO q_main
       MOVE 10 TO r_main
       COMPUTE TEMP_1 = r_main + 1 - p_main + q_main
       MOVE TEMP_1 TO x_check
       PERFORM check-PARA
=======
       MAIN-PARA.
       MOVE 5 TO a_main
       MOVE 7 TO b_main
       MOVE 8 TO c_main
       MOVE 9 TO d_main
       DIVIDE a_main BY b_main GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = TEMP_1 + c_main
       COMPUTE d_main = TEMP_2
>>>>>>> fa3c8b3a9fd6aaef27227d5625d1c6218356bd63
       EXIT.


