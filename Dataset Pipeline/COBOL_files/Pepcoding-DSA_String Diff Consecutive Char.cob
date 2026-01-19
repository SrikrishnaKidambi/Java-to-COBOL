       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_String Diff Consecutive Char.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  str_solution    PIC X(100).
      * Variables for Scope:BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  sb_solution     PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_SOLUTION_CLASS_MAIN_GLOBAL
       01  i_solution      PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  str_main        PIC X(100).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       solution-PARA.
       COMPUTE TEMP_0 = str_solution.length() - 1
       PERFORM VARYING i_solution FROM 0 BY 1 UNTIL NOT (i_solution < TEMP_0)
      * append first character in pair
      * append difference in ASCII values in pair
       COMPUTE TEMP_0 = str_solution.length() - 1
       END-PERFORM
      * append last character (corner case)
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT str_main
       DISPLAY solution(str_main)
       EXIT.


