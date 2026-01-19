       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_AllPrimeNumbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_ALLPRIMENUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_ALLPRIMENUMBERS_GLOBAL
       01  scan_main       PIC X(100).
       01  n_main          PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_ALLPRIMENUMBERS_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_ALLPRIMENUMBERS_GLOBAL
       01  flag_main       PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_ALLPRIMENUMBERS_GLOBAL
       01  j_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       PERFORM VARYING i_main FROM 2 BY 1 UNTIL NOT (i_main <= n_main)
       MOVE 0 TO flag_main
       PERFORM VARYING j_main FROM 2 BY 1 UNTIL NOT (j_main <= i_main)
       DIVIDE i_main BY j_main GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0  AND  i_main != j_main
       MOVE 1 TO flag_main
       END-IF
       END-PERFORM
       IF flag_main = 0
       DISPLAY i_main
       ELSE
       MOVE 0 TO flag_main
       END-IF
       END-PERFORM
       EXIT.


