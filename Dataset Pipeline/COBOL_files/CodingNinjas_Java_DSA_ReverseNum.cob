       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_ReverseNum.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_REVERSENUM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_REVERSENUM_GLOBAL
       01  scan_main       PIC X(100).
       01  N_main          PIC S9(5).
       01  rev_main        PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAIN_CLASS_REVERSENUM_GLOBAL
       01  rem_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
      * Input from ODT is enabled
       ACCEPT N_main
       MOVE 0 TO rev_main
       PERFORM UNTIL NOT (N_main > 0)
       DIVIDE N_main BY 10 GIVING rem_main REMAINDER rem_main
      * System.out.println(rem);
       ADD rev_main TO rem_main GIVING rev_main
       DIVIDE N_main BY 10 GIVING N_main
       IF N_main > 0
       MULTIPLY rev_main BY 10 GIVING rev_main
       END-IF
       END-PERFORM
       DISPLAY rev_main
       EXIT.


