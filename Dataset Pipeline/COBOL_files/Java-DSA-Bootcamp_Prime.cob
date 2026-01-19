       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Prime.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PRIME_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PRIME_GLOBAL
       01  in_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  c_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Please enter a number: " WITH NO ADVANCING
       ACCEPT n_main
       IF n_main <= 1
       DISPLAY "Neither prime nor composite"
       GOBACK
       END-IF
       MOVE 2 TO c_main
       COMPUTE TEMP_0 = c_main * c_main
       PERFORM UNTIL NOT (TEMP_0 <= n_main)
       DIVIDE n_main BY c_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
       DISPLAY "Not Prime"
       GOBACK
       END-IF
       ADD c_main TO 1 GIVING c_main
       COMPUTE TEMP_0 = c_main * c_main
       END-PERFORM
       MULTIPLY c_main BY c_main GIVING TEMP_2
       IF TEMP_2 > n_main
       DISPLAY "Prime"
       END-IF
       EXIT.


