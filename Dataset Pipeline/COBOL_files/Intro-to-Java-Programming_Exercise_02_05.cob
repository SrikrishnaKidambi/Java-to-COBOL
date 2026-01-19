       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_05.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_05_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_05_GLOBAL
       01  input_main      PIC X(100).
       01  subtotal_main   PIC S9(5)V9(2).
       01  gratuityRate_main PIC S9(5)V9(2).
       01  gratuity_main   PIC S9(5)V9(2).
       01  total_main      PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object.
      * Input from ODT is enabled
      * Prompt the user to enter the subtotal and the gratuity rate
       DISPLAY "Enter the subtotal and a gratuity rate: " WITH NO ADVANCING
       ACCEPT subtotal_main
       ACCEPT gratuityRate_main
      * Calculate gratuity and total
       COMPUTE TEMP_0 = gratuityRate_main / 100
       COMPUTE TEMP_1 = subtotal_main * TEMP_0
       COMPUTE gratuity_main = TEMP_1
       ADD subtotal_main TO gratuity_main GIVING total_main
      * Display results
       DISPLAY "The gratuity is $"
       DISPLAY gratuity_main
       DISPLAY " and total is $"
       DISPLAY total_main
       EXIT.


