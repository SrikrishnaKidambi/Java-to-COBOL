       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_02_02.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_02_02_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_02_02_GLOBAL
       01  input_main      PIC X(100).
       01  PI_main         PIC S9(5)V9(2).
       01  radius_main     PIC S9(5)V9(2).
       01  length_main     PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01  volume_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner object
      * Input from ODT is enabled
      * Prompt user to enter the radius and length of a cylinder
       DISPLAY "Enter the radius and length of a cylinder: " WITH NO ADVANCING
       ACCEPT radius_main
       ACCEPT length_main
      * Comput the area and volume
       COMPUTE TEMP_0 = radius_main * radius_main
       COMPUTE TEMP_1 = TEMP_0 * PI_main
       COMPUTE area_main = TEMP_1
       MULTIPLY area_main BY length_main GIVING volume_main
      * Display results
       DISPLAY "The area is "
       DISPLAY area_main
       DISPLAY "The volume is "
       DISPLAY volume_main
       EXIT.


