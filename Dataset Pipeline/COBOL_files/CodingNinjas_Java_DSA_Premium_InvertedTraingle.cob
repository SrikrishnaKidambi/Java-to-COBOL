       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_InvertedTraingle.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_INVERTEDTRAINGLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_INVERTEDTRAINGLE_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  rows_main       PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_INVERTEDTRAINGLE_GLOBAL
       01  cols_main       PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE 1 TO rows_main
       PERFORM UNTIL NOT (rows_main <= n_main)
       MOVE 1 TO cols_main
       COMPUTE TEMP_0 = n_main - rows_main + 1
       PERFORM UNTIL NOT (cols_main <= TEMP_0)
       MOVE '*' TO TEMP_1
       DISPLAY TEMP_1 WITH NO ADVANCING
       ADD 1 TO cols_main
       COMPUTE TEMP_0 = n_main - rows_main + 1
       END-PERFORM
       ADD 1 TO rows_main
       END-PERFORM
       EXIT.


