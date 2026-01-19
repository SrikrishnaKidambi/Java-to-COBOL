       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_AverageMarks.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_AVERAGEMARKS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_AVERAGEMARKS_GLOBAL
       01  s_main          PIC X(100).
       01  str_main        PIC X(100).
       01  ch_main         PIC X(1).
       01  m1_main         PIC S9(5).
       01  m2_main         PIC S9(5).
       01  m3_main         PIC S9(5).
       01  average_main    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT str_main
       MOVE FUNCTION CHAR(str_main.charAt(0)) TO ch_main
       ACCEPT m1_main
       ACCEPT m2_main
       ACCEPT m3_main
       COMPUTE TEMP_0 = m1_main + m2_main
       COMPUTE TEMP_1 = TEMP_0 + m3_main
       COMPUTE TEMP_2 = TEMP_1 / 3
       COMPUTE average_main = TEMP_2
       DISPLAY ch_main
       DISPLAY average_main
       EXIT.


