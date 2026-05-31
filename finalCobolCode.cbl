       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestString.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  s_main          PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE "Hello" TO s_main
       DISPLAY s_main.length()
       DISPLAY s_main.toUpperCase()
       DISPLAY s_main.charAt(1)
       DISPLAY s_main.substring(1, 3)
       EXIT.


