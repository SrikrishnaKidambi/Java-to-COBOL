       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Grading System.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  marks_main      PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * input - don't change this code
      * Input from ODT is enabled
       ACCEPT marks_main
      * input - don't change this code
      * code here
       IF marks_main > 90
       DISPLAY "excellent"
       ELSE
       IF marks_main > 80
       DISPLAY "good"
       ELSE
       IF marks_main > 70
       DISPLAY "fair"
       ELSE
       IF marks_main > 60
       DISPLAY "meets expectations"
       ELSE
       DISPLAY "below par"
       END-IF
       END-IF
       END-IF
       END-IF
       EXIT.


