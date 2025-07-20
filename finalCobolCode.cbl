       IDENTIFICATION DIVISION.
       PROGRAM-ID. AlphabetPosition.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  sc_main         PIC X(100).
       01  ch_main         PIC X(1).
       01  position_main   PIC S9(5).



       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a lowercase letter: " WITH NO ADVANCING
       ACCEPT ch_main
       COMPUTE position_main = FUNCTION ORD(ch_main) - FUNCTION ORD('a') + 1
       DISPLAY "Position in alphabet: "   position_main
       STOP RUN.

