       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Toggle Case.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_TOGGLECASE_CLASS_MAIN_GLOBAL
       01  str_toggleCase  PIC X(100).
      * Variables for Scope:BLOCK_METHOD_TOGGLECASE_CLASS_MAIN_GLOBAL
       01  ans_toggleCase  PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_TOGGLECASE_CLASS_MAIN_GLOBAL
       01  i_toggleCase    PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  str_main        PIC X(100).
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


       toggleCase-PARA.
       MOVE "" TO ans_toggleCase
       COMPUTE TEMP_0 = str_toggleCase.length()
       PERFORM VARYING i_toggleCase FROM 0 BY 1 UNTIL NOT (i_toggleCase < TEMP_0)
       COMPUTE TEMP_1 = i_toggleCase
       COMPUTE TEMP_2 = i_toggleCase
       IF TEMP_1 >= 'A'  AND  TEMP_2 <= 'Z'
       COMPUTE TEMP_3 = i_toggleCase + 32
       COMPUTE TEMP_4 = charAt + TEMP_3
       COMPUTE ans_toggleCase = TEMP_4
       ELSE
       COMPUTE TEMP_5 = i_toggleCase - 32
       COMPUTE TEMP_6 = charAt + TEMP_5
       COMPUTE ans_toggleCase = TEMP_6
       END-IF
       COMPUTE TEMP_0 = str_toggleCase.length()
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT str_main
       DISPLAY toggleCase(str_main)
       EXIT.


