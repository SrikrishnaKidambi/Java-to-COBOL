       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Print Z.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Write your code here
       DISPLAY "*****"
       DISPLAY "   *"
       DISPLAY "  *"
       DISPLAY " *"
       DISPLAY "*****"
       EXIT.


