       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program88.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM88_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM88_GLOBAL
       01  num_main        PIC S9(5).
       01  i_main          PIC S9(5).
       01  prime_main      PIC X(1).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 29 TO num_main
       MOVE 'Y' TO prime_main
       MOVE 2 TO i_main
       COMPUTE TEMP_0 = num_main / 2
       PERFORM UNTIL NOT (i_main <= TEMP_0)
       DIVIDE num_main BY i_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       MOVE 'N' TO prime_main
       END-IF
       ADD 1 TO i_main
       COMPUTE TEMP_0 = num_main / 2
       END-PERFORM
       IF prime_main
       DISPLAY "Prime"
       ELSE
       DISPLAY "Not Prime"
       END-IF
       EXIT.


