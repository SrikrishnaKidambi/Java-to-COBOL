       IDENTIFICATION DIVISION.
       PROGRAM-ID. Program34_CheckPalindromeNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_PROGRAM34_CHECKPALINDROMENUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_PROGRAM34_CHECKPALINDROMENUMBER_GLOBAL
       01  num_main        PIC S9(5).
       01  temp_main       PIC S9(5).
       01  rev_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       MOVE 1221 TO num_main
       MOVE num_main TO temp_main
       MOVE 0 TO rev_main
       PERFORM UNTIL NOT (temp_main NOT = 0)
       COMPUTE TEMP_0 = rev_main * 10
       DIVIDE temp_main BY 10 GIVING TEMP_1 REMAINDER TEMP_2
       COMPUTE TEMP_3 = TEMP_0 + TEMP_2
       COMPUTE rev_main = TEMP_3
       DIVIDE temp_main BY 10 GIVING temp_main
       END-PERFORM
       IF rev_main = num_main
       DISPLAY 1
       ELSE
       DISPLAY 0
       END-IF
       EXIT.


