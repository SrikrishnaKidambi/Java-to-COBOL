       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_18.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_18_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_18_GLOBAL
       01  input_main      PIC X(100).
       01  weight_main     PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_IF_BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_18_GLOBAL
       01  costPerPound_main PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter the weight of the package
       DISPLAY "Enter the weight of the package: " WITH NO ADVANCING
       ACCEPT weight_main
      * Calculate cost of shipping
       IF weight_main > 50
       DISPLAY "The package cannot be shipped."
       ELSE
       IF weight_main > 0  AND  weight_main <= 1
       COMPUTE costPerPound_main = 5
       ELSE
       IF weight_main <= 3
       COMPUTE costPerPound_main = 5
       ELSE
       IF weight_main <= 10
       COMPUTE costPerPound_main = 5
      * if (weight <= 20)
       ELSE
       COMPUTE costPerPound_main = 5
       END-IF
       END-IF
       END-IF
       DISPLAY "Shipping cost of package is $"
       MULTIPLY costPerPound_main BY weight_main GIVING TEMP_0
       DISPLAY TEMP_0
       END-IF
       EXIT.


