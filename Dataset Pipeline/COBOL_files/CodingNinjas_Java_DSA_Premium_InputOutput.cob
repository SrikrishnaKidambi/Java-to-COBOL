       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_InputOutput.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_INPUTOUTPUT_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_INPUTOUTPUT_GLOBAL
       01  s_main          PIC X(100).
       01  a_main          PIC S9(5).
       01  str_main        PIC X(100).
       01  str1_main       PIC X(100).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
      * to take integer as input
       ACCEPT a_main
       DISPLAY a_main
      * to take first word as input.
       ACCEPT str_main
       DISPLAY str_main
      * to take entire line as Input.
       ACCEPT str1_main
       DISPLAY str1_main
       EXIT.


