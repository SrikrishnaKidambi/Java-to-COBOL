       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pepcoding-DSA_Digit Frequency.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  scn_main        PIC X(100).
       01  n_main          PIC S9(5).
       01  d_main          PIC S9(5).
       01  f_main          PIC S9(5).
      * Variables for Scope:METHOD_GETDIGITFREQUENCY_CLASS_MAIN_GLOBAL
       01  n_getDigitFrequency PIC S9(5).
       01  d_getDigitFrequency PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_GETDIGITFREQUENCY_CLASS_MAIN_GLOBAL
       01  freq_getDigitFrequency PIC S9(5).
      * Variables for Scope:BLOCK_WHILE_BLOCK_METHOD_GETDIGITFREQUENCY_CLASS_MAIN_GLOBAL
       01  dig_getDigitFrequency PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getDigitFrequency-PARA.
      * write code here
       MOVE 0 TO freq_getDigitFrequency
       PERFORM UNTIL NOT (n_getDigitFrequency > 0)
       DIVIDE n_getDigitFrequency BY 10 GIVING dig_getDigitFrequency REMAINDER dig_getDigitFrequency
       DIVIDE n_getDigitFrequency BY 10 GIVING n_getDigitFrequency
       IF dig_getDigitFrequency = d_getDigitFrequency
       ADD 1 TO freq_getDigitFrequency
       END-IF
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * Input from ODT is enabled
       ACCEPT n_main
       ACCEPT d_main
       MOVE getDigitFrequency(n_main, d_main) TO f_main
       DISPLAY f_main
       EXIT.


