       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_AverageMarks.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_AVERAGEMARKS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_AVERAGEMARKS_GLOBAL
       01  scan_main       PIC X(100).
       01  name_main       PIC X(100).
       01  m1_main         PIC S9(5).
       01  m2_main         PIC S9(5).
       01  m3_main         PIC S9(5).
       01  avg_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT name_main
       ACCEPT m1_main
       ACCEPT m2_main
       ACCEPT m3_main
       COMPUTE TEMP_0 = m1_main + m2_main
       COMPUTE TEMP_1 = TEMP_0 + m3_main
       COMPUTE TEMP_2 = TEMP_1 / 3
       COMPUTE avg_main = TEMP_2
       DISPLAY name_main
       DISPLAY avg_main
       EXIT.


