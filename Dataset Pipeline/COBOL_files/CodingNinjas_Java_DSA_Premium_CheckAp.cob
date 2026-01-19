       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_CheckAp.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CHECKAP_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CHECKAP_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  firstNumber_main PIC S9(5).
       01  prevNumber_main PIC S9(5).
       01  d_main          PIC S9(5).
       01  count_main      PIC S9(5).
       01  isAP_main       PIC X(1).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CHECKAP_GLOBAL
       01  current_main    PIC S9(5).
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
       ACCEPT firstNumber_main
       ACCEPT prevNumber_main
       SUBTRACT firstNumber_main FROM prevNumber_main GIVING d_main
       MOVE 2 TO count_main
       MOVE 'Y' TO isAP_main
       PERFORM UNTIL NOT (count_main < n_main)
       ACCEPT current_main
       COMPUTE TEMP_1 = current_main - prevNumber_main
       COMPUTE TEMP_0 = TEMP_1
       IF TEMP_0 != d_main
       MOVE 'N' TO isAP_main
       EXIT PERFORM
       ELSE
       MOVE current_main TO prevNumber_main
       END-IF
       ADD 1 TO count_main
       END-PERFORM
       IF isAP_main
       DISPLAY "true"
       ELSE
       DISPLAY "false"
       END-IF
       EXIT.


