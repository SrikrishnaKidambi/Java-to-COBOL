       IDENTIFICATION DIVISION.
       PROGRAM-ID. P18_LogFunctions.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_P18_LOGFUNCTIONS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_P18_LOGFUNCTIONS_GLOBAL
       01  sc_main         PIC X(100).
       01  x_main          PIC S9(5)V9(2).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT x_main
       DISPLAY Math.log(x_main)
       DISPLAY Math.log10(x_main)
       EXIT.


