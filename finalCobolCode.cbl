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
       01  c_main          PIC S9(5).
       01  d_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 5 TO a_main
       MOVE 7 TO b_main
       MOVE 8 TO c_main
       MOVE 9 TO d_main
       DIVIDE a_main BY b_main GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = TEMP_1 + c_main
       COMPUTE d_main = TEMP_2
       EXIT.


