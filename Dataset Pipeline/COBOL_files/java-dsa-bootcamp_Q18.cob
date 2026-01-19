       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q18.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q18_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q18_GLOBAL
       01  num_main        PIC S9(5).
       01  newNum_main     PIC S9(5).
       01  rev_main        PIC S9(5).
       01  sc_main         PIC X(100).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT num_main
       MOVE num_main TO newNum_main
      * reversing a number
       PERFORM UNTIL NOT (num_main NOT = 0)
       DIVIDE num_main BY 10 GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = rev_main * 10
       COMPUTE TEMP_3 = TEMP_1 + TEMP_2
       COMPUTE rev_main = TEMP_3
       DIVIDE num_main BY 10 GIVING num_main
       END-PERFORM
      * checking
       DISPLAY (rev_main == newNum_main) ? "Palindrome" : "NOT Palindrome" WITH NO ADVANCING
       EXIT.


