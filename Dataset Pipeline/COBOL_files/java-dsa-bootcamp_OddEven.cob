       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_OddEven.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ODDEVEN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ODDEVEN_GLOBAL
       01  in_main         PIC X(100).
       01  a_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT a_main
       DIVIDE a_main BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY "Even"
       ELSE
       DISPLAY "Odd"
       END-IF
       EXIT.


