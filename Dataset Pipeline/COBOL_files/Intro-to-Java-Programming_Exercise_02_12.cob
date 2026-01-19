       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_12_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_12_GLOBAL
       01  input_main      PIC X(100).
       01  speed_main      PIC S9(5)V9(2).
       01  acceleration_main PIC S9(5)V9(2).
       01  length_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create new Scanner object.
      * Input from ODT is enabled
      * Prompt user to enter the airplane's acceleration a and take-off spead v.
       DISPLAY "Enter speed and acceleration: " WITH NO ADVANCING
       ACCEPT speed_main
       ACCEPT acceleration_main
      * Compute the minimum runway length
      * needed for an airplane to take off.
       COMPUTE TEMP_0 = 2 * acceleration_main
       COMPUTE TEMP_1 = 2 / TEMP_0
       COMPUTE length_main = TEMP_1
      * Display result
       DISPLAY "The minimum runway length for this"
       DISPLAY " airplane is "
       DISPLAY length_main
       EXIT.


