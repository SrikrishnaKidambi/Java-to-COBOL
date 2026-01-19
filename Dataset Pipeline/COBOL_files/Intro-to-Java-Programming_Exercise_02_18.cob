       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_18.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_18_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_18_GLOBAL
       01  a_main          PIC S9(5)V9(2).
       01  b_main          PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "a        b        pow(a, b)"
       MOVE 1 TO a_main
       MOVE 2 TO b_main
       DISPLAY FUNCTION INTEGER(a_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(b_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(Math.pow(a_main), b_main)
       ADD 1 TO a_main
       ADD 1 TO b_main
       DISPLAY FUNCTION INTEGER(a_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(b_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(Math.pow(a_main), b_main)
       ADD 1 TO a_main
       ADD 1 TO b_main
       DISPLAY FUNCTION INTEGER(a_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(b_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(Math.pow(a_main), b_main)
       ADD 1 TO a_main
       ADD 1 TO b_main
       DISPLAY FUNCTION INTEGER(a_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(b_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(Math.pow(a_main), b_main)
       ADD 1 TO a_main
       ADD 1 TO b_main
       DISPLAY FUNCTION INTEGER(a_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(b_main)
       DISPLAY "        "
       DISPLAY FUNCTION INTEGER(Math.pow(a_main), b_main)
       EXIT.


