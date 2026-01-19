       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q12_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q12_GLOBAL
       01  sc_main         PIC X(100).
       01  side_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Perimeter of square
      * Input from ODT is enabled
       DISPLAY "Enter the length of the side of the square: "
       ACCEPT side_main
       DISPLAY "The perimeter of the square is "
       COMPUTE TEMP_1 = side_main * 4
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0
       EXIT.


