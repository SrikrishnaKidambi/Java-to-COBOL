       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_CheckArmstrongNum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CHECKARMSTRONGNUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CHECKARMSTRONGNUM_GLOBAL
       01  scan_main       PIC X(100).
       01  n_main          PIC S9(5).
       01  orig_n_main     PIC S9(5).
       01  sum_main        PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CHECKARMSTRONGNUM_GLOBAL
       01  rem_main        PIC S9(5).
       01  sum_rem_main    PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_CHECKARMSTRONGNUM_GLOBAL
       01  i_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT n_main
       MOVE n_main TO orig_n_main
       PERFORM UNTIL NOT (orig_n_main > 0)
       ADD count_main TO 1 GIVING count_main
       DIVIDE orig_n_main BY 10 GIVING orig_n_main
       END-PERFORM
      * System.out.println(count);
       MOVE n_main TO orig_n_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 10 GIVING rem_main REMAINDER rem_main
       MOVE 1 TO sum_rem_main
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < count_main)
       MULTIPLY sum_rem_main BY rem_main GIVING sum_rem_main
       END-PERFORM
       ADD sum_main TO sum_rem_main GIVING sum_main
      * System.out.println(sum);
       DIVIDE n_main BY 10 GIVING n_main
       END-PERFORM
       IF sum_main = orig_n_main
       DISPLAY "true"
       ELSE
       DISPLAY "false"
       END-IF
       EXIT.


