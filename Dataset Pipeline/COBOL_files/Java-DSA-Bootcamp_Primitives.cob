       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Primitives.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PRIMITIVES_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PRIMITIVES_GLOBAL
       01  rollno_main     PIC S9(5).
       01  letter_main     PIC X(1).
       01  marks_main      PIC S9(5)V9(2).
       01  c_main          PIC S9(5)V9(2).
       01  largeDecimalNumbers_main PIC S9(5)V9(2).
       01  largeInteger_main PIC S9(5).
       01  check_main      PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 64 TO rollno_main
       MOVE 'r' TO letter_main
       MOVE 34567834567876543L TO largeInteger_main
       MOVE 'N' TO check_main
       ADD 1 TO c_main
      * c = (int)(c) + 1;
       DISPLAY c_main
       EXIT.


