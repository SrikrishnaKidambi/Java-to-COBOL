       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program73.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM73_CHECKPRIME_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM73_CHECKPRIME_GLOBAL
       01  n_main          PIC S9(5).
       01  isPrime_main    PIC X(1).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_PROGRAM73_CHECKPRIME_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 29 TO n_main
       MOVE 'Y' TO isPrime_main
       COMPUTE TEMP_0 = n_main / 2
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main <= TEMP_0)
       DIVIDE n_main BY i_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       MOVE 'N' TO isPrime_main
       END-IF
       COMPUTE TEMP_0 = n_main / 2
       END-PERFORM
       IF isPrime_main
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       EXIT.


