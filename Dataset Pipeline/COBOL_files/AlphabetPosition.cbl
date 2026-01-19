       IDENTIFICATION DIVISION.
       PROGRAM-ID. AlphabetPosition.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  ch1              PIC X(1).
       01  position1        PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a lowercase letter: " WITH NO ADVANCING
       ACCEPT ch1
       COMPUTE position1 = FUNCTION ORD(ch1) - FUNCTION ORD('a') + 1
       DISPLAY "Position in alphabet: "   position1
       EXIT.
       STOP RUN.

