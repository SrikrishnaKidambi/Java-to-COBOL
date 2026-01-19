       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_EvenNumbersBetween2Numbers.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINTEVENNUMBERS_CLASS_EVENNUMBERSBETWEEN2NUMBERS_GLOBAL
       01  start_printEvenNumbers PIC S9(5).
       01  end_printEvenNumbers PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_PRINTEVENNUMBERS_CLASS_EVENNUMBERSBETWEEN2NUMBERS_GLOBAL
       01  i_printEvenNumbers PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_EVENNUMBERSBETWEEN2NUMBERS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EVENNUMBERSBETWEEN2NUMBERS_GLOBAL
       01  s_main          PIC X(100).
       01  start_main      PIC S9(5).
       01  end_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       printEvenNumbers-PARA.
       DIVIDE start_printEvenNumbers BY 2 GIVING TEMP_0 REMAINDER TEMP_0
       IF TEMP_0 != 0
      * to check if number is odd, if it is increment it by 1
       ADD 1 TO start_printEvenNumbers
       END-IF
       PERFORM VARYING i_printEvenNumbers FROM start_printEvenNumbers BY 2 UNTIL NOT (i_printEvenNumbers <= end_printEvenNumbers)
       DISPLAY i_printEvenNumbers
       END-PERFORM
       EXIT.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT start_main
       ACCEPT end_main
       MOVE start_main TO start_printEvenNumbers
       MOVE end_main TO end_printEvenNumbers
       PERFORM printEvenNumbers-PARA
       EXIT.


