       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_SquareRoot.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_SQUAREROOT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_SQUAREROOT_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO i_main
       COMPUTE TEMP_0 = i_main * i_main
       PERFORM UNTIL NOT (TEMP_0 <= n_main)
       ADD 1 TO i_main
       COMPUTE TEMP_0 = i_main * i_main
       END-PERFORM
       SUBTRACT 1 FROM i_main GIVING TEMP_1
       DISPLAY TEMP_1
       EXIT.


