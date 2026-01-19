       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q23.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q23_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q23_GLOBAL
       01  in_main         PIC X(100).
       01  num_main        PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_Q23_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input a number and print all the factors of that number (use loops).
      * Input from ODT is enabled
      * Input number from user
       DISPLAY "Please enter number:"
       ACCEPT num_main
      * for (initial i = 1;i is lessthanEqualto number; i ++)
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= num_main)
      * that means
            12 / 4 = 3
            12 / 3 = 4
       DIVIDE num_main BY i_main GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 = 0
       DISPLAY " "
       DISPLAY i_main
       END-IF
       END-PERFORM
       EXIT.


