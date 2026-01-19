       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_26.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_26_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_26_GLOBAL
       01  e_main          PIC S9(5)V9(2).
       01  value_main      PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_26_GLOBAL
       01  i_main          PIC S9(5)V9(2).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_26_GLOBAL
       01  denominator_main PIC S9(5)V9(2).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_26_GLOBAL
       01  k_main          PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Compute e value for i = 10000
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= value_main)
       MOVE i_main TO denominator_main
       PERFORM VARYING k_main FROM i_main BY -1 UNTIL NOT (k_main >= 1)
       SUBTRACT 1 FROM i_main GIVING k_main
       MULTIPLY denominator_main BY k_main GIVING denominator_main
       END-PERFORM
       COMPUTE TEMP_0 = 1 / denominator_main
       COMPUTE TEMP_1 = e_main + TEMP_0
       COMPUTE e_main = TEMP_1
       END-PERFORM
      * Display result
       DISPLAY "The e value for i = 10000: "
       DISPLAY e_main
      * Compute e value for i = 20000
       COMPUTE e_main = 0
       COMPUTE value_main = 0
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= value_main)
       MOVE i_main TO denominator_main
       PERFORM VARYING k_main FROM i_main BY -1 UNTIL NOT (k_main >= 1)
       SUBTRACT 1 FROM i_main GIVING k_main
       MULTIPLY denominator_main BY k_main GIVING denominator_main
       END-PERFORM
       COMPUTE TEMP_2 = 1 / denominator_main
       COMPUTE TEMP_3 = e_main + TEMP_2
       COMPUTE e_main = TEMP_3
       END-PERFORM
      * display result
       DISPLAY "The e value for i = 20000: "
       DISPLAY e_main
      * Compute e value for i = 100000
       COMPUTE e_main = 0
       COMPUTE value_main = 0
       PERFORM VARYING i_main FROM 1 BY 1 UNTIL NOT (i_main <= value_main)
       MOVE i_main TO denominator_main
       PERFORM VARYING k_main FROM i_main BY -1 UNTIL NOT (k_main >= 1)
       SUBTRACT 1 FROM i_main GIVING k_main
       MULTIPLY denominator_main BY k_main GIVING denominator_main
       END-PERFORM
       COMPUTE TEMP_4 = 1 / denominator_main
       COMPUTE TEMP_5 = e_main + TEMP_4
       COMPUTE e_main = TEMP_5
       END-PERFORM
      * Display result
       DISPLAY "The e value for i = 100000: "
       DISPLAY e_main
       EXIT.


