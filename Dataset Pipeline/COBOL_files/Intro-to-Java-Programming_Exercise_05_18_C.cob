       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_18_C.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_18_C_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_C_GLOBAL
       01  numberOfLines_main PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_C_GLOBAL
       01  rows_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_18_C_GLOBAL
       01  s_main          PIC S9(5).
       01  col_main        PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display pattern C
       MOVE 6 TO numberOfLines_main
       DISPLAY "Pattern C"
       PERFORM VARYING rows_main FROM 1 BY 1 UNTIL NOT (rows_main <= numberOfLines_main)
       PERFORM VARYING s_main FROM numberOfLines_main BY -1 UNTIL NOT (s_main >= 1)
       SUBTRACT rows_main FROM numberOfLines_main GIVING s_main
       DISPLAY "  " WITH NO ADVANCING
       END-PERFORM
       PERFORM VARYING col_main FROM rows_main BY -1 UNTIL NOT (col_main >= 1)
       DISPLAY col_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-PERFORM
       END-PERFORM
       EXIT.


