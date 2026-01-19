       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q25.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q25_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q25_GLOBAL
       01  sc_main         PIC X(100).
       01  n_main          PIC S9(5).
       01  sum_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter the digit: "
       ACCEPT n_main
       MOVE 0 TO sum_main
       PERFORM UNTIL NOT (n_main NOT = 0)
       DIVIDE n_main BY 10 GIVING TEMP_0 REMAINDER TEMP_1
       COMPUTE TEMP_2 = sum_main + TEMP_1
       COMPUTE sum_main = TEMP_2
       DIVIDE n_main BY 10 GIVING n_main
       END-PERFORM
       DISPLAY "Sum of digit:"
       DISPLAY sum_main
       EXIT.


