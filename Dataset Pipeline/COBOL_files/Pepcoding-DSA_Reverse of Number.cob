       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Reverse of Number.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * write your code here
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM UNTIL NOT (n_main > 0)
       DIVIDE n_main BY 10 GIVING TEMP_0 REMAINDER TEMP_0
       DISPLAY TEMP_0
       DIVIDE n_main BY 10 GIVING n_main
       END-PERFORM
       EXIT.


