       IDENTIFICATION DIVISION.
       PROGRAM-ID. P24_MethodPrint.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINTNUM_CLASS_P24_METHODPRINT_GLOBAL
       01  x_printNum      PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_P24_METHODPRINT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       printNum-PARA.
       DISPLAY x_printNum_printNum
       EXIT.


       MAIN-PARA.
       MOVE 25 TO x_printNum
       PERFORM printNum-PARA
       EXIT.


