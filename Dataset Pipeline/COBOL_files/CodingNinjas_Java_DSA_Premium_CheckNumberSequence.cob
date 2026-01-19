       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_CheckNumberSequence.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CHECKNUMBERSEQUENCE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CHECKNUMBERSEQUENCE_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01  prev_main       PIC S9(5).
       01  count_main      PIC S9(5).
       01  current_main    PIC S9(5).
       01  isDec_main      PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT prev_main
       MOVE 'Y' TO isDec_main
       PERFORM UNTIL NOT (count_main <= n_main)
       ACCEPT current_main
       ADD 1 TO count_main
      * now we start to check the sequence
       IF current_main = prev_main
      * if 2 numbers are equal we simply exit the loop
       DISPLAY "false"
       GOBACK
       ELSE
       IF current_main < prev_main
       IF isDec_main = false
       DISPLAY "false"
       GOBACK
       END-IF
       ELSE
       IF isDec_main = true
       MOVE 'N' TO isDec_main
       END-IF
       END-IF
       END-IF
       MOVE current_main TO prev_main
       END-PERFORM
       DISPLAY "true"
       EXIT.


