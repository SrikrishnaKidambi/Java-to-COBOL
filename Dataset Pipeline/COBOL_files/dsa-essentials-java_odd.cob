       IDENTIFICATION DIVISION.
       PROGRAM-ID. dsa-essentials-java_odd.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ODD_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ODD_GLOBAL
       01  scanner_main    PIC X(100).
       01  n_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       IF (n_main & 1) = 1
       DISPLAY "Odd"
       ELSE
       DISPLAY "Even"
       END-IF
       EXIT.


