       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_06.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_06_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_06_GLOBAL
       01  input_main      PIC X(100).
       01  weight_main     PIC S9(5)V9(2).
       01  feet_main       PIC S9(5)V9(2).
       01  inches_main     PIC S9(5)V9(2).
       01  KILOGRAMS_PER_POUND_main PIC S9(5)V9(2).
       01  METERS_PER_INCH_main PIC S9(5)V9(2).
       01  FEET_PER_INCH_main PIC S9(5)V9(2).
       01  height_main     PIC S9(5)V9(2).
       01  bmi_main        PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter weight, feet and inches
       DISPLAY "Enter weight in pounds: " WITH NO ADVANCING
       ACCEPT weight_main
       DISPLAY "Enter feet: " WITH NO ADVANCING
       ACCEPT feet_main
       DISPLAY "Enter inches: " WITH NO ADVANCING
       ACCEPT inches_main
      * Constant
      * Constant
      * Constant
      * Compute BMI
       MULTIPLY weight_main BY KILOGRAMS_PER_POUND_main GIVING weight_main
       COMPUTE TEMP_0 = feet_main / FEET_PER_INCH_main
       COMPUTE TEMP_1 = inches_main + TEMP_0
       COMPUTE TEMP_2 = TEMP_1 * METERS_PER_INCH_main
       COMPUTE TEMP_3 = height_main ( TEMP_2
       COMPUTE height_main = TEMP_3
       COMPUTE TEMP_4 = height_main / 2
       COMPUTE bmi_main = TEMP_4
      * Display result
       DISPLAY "BMI is "
       DISPLAY bmi_main
       IF bmi_main < 18.5
       DISPLAY "Underweight"
       ELSE
       IF bmi_main < 25
       DISPLAY "Normal"
       ELSE
       IF bmi_main < 30
       DISPLAY "Overweight"
       ELSE
       DISPLAY "Obese"
       END-IF
       END-IF
       END-IF
       EXIT.


