       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_18_B.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_18_B_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_B_GLOBAL
       01  r_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_B_GLOBAL
       01  c_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display pattern B
       DISPLAY "Pattern B"
       PERFORM VARYING r_main FROM 6 BY -1 UNTIL NOT (r_main >= 1)
       PERFORM VARYING c_main FROM 1 BY 1 UNTIL NOT (c_main <= r_main)
       DISPLAY c_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


