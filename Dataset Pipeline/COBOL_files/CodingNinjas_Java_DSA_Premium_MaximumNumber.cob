       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_MaximumNumber.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAX_NUMBER_CLASS_SOLUTION_CLASS_MAXIMUMNUMBER_GLOBAL
       01  n_max_number    PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_MAX_NUMBER_CLASS_SOLUTION_CLASS_MAXIMUMNUMBER_GLOBAL
       01  maxNum_max_number PIC S9(5).
       01  i_max_number    PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_MAX_NUMBER_CLASS_SOLUTION_CLASS_MAXIMUMNUMBER_GLOBAL
       01  newNum_max_number PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAXIMUMNUMBER_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAXIMUMNUMBER_GLOBAL
       01  s_main          PIC X(100).
       01  n_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       max_number-PARA.
      * * Your class should be named Solution Don't write main(). Don't read input, it
			 * is passed as function argument. Return output and don't print it. Taking
			 * input and printing output is handled automatically.
       MOVE 0 TO maxNum_max_number
       MOVE 1 TO i_max_number
       COMPUTE TEMP_0 = n_max_number / i_max_number
       PERFORM UNTIL NOT (TEMP_0 > 0)
       COMPUTE TEMP_1 = i_max_number * 10
       COMPUTE TEMP_2 = n_max_number / TEMP_1
       COMPUTE TEMP_3 = TEMP_2 * i_max_number
       DIVIDE n_max_number BY i_max_number GIVING TEMP_4 REMAINDER TEMP_5
       COMPUTE TEMP_6 = TEMP_3 + TEMP_5
       COMPUTE newNum_max_number = TEMP_6
       MULTIPLY i_max_number BY 10 GIVING i_max_number
       IF maxNum_max_number < newNum_max_number
       MOVE newNum_max_number TO maxNum_max_number
       END-IF
       COMPUTE TEMP_0 = n_max_number / i_max_number
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT n_main
       DISPLAY Solution.max_number(n_main)
       EXIT.


