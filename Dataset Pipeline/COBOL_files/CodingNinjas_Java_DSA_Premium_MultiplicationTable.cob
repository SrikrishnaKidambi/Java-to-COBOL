       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_MultiplicationTable.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MULTIPLICATIONTABLE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MULTIPLICATIONTABLE_GLOBAL
       01  s_main          PIC X(100).
       01  number_main     PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_MULTIPLICATIONTABLE_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT number_main
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main < 11)
       MULTIPLY number_main BY i_main GIVING TEMP_0
       DISPLAY TEMP_0
       END-PERFORM
       EXIT.


