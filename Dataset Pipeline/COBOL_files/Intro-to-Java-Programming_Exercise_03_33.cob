       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_33.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_33_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_33_GLOBAL
       01  input_main      PIC X(100).
       01  weight1_main    PIC S9(5)V9(2).
       01  price1_main     PIC S9(5)V9(2).
       01  weight2_main    PIC S9(5)V9(2).
       01  price2_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create Scanner object
      * Input from ODT is enabled
      * Prompt the user to enter the weight and price of each package
       DISPLAY "Enter weight and price for package 1: " WITH NO ADVANCING
       ACCEPT weight1_main
       ACCEPT price1_main
       DISPLAY "Enter weight and price for package 2: " WITH NO ADVANCING
       ACCEPT weight2_main
       ACCEPT price2_main
       DIVIDE price1_main BY weight1_main GIVING TEMP_0
       IF TEMP_0 < price2_main / weight2_main
       DISPLAY "Package 1 has a better price."
       ELSE
       DIVIDE price1_main BY weight1_main GIVING TEMP_1
       IF TEMP_1 > price2_main / weight2_main
       DISPLAY "Package 2 has a better price."
       ELSE
       DISPLAY "Two packages have the same price."
       END-IF
       END-IF
       EXIT.


