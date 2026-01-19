       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q16.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q16_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q16_GLOBAL
       01  sc_main         PIC X(100).
       01  radius_main     PIC S9(5)V9(2).
       01  height_main     PIC S9(5)V9(2).
       01  volume_main     PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * volume of cylinder
      * Input from ODT is enabled
       DISPLAY "Enter the radius of the cylinder: "
       ACCEPT radius_main
       DISPLAY "Enter the height of the cylinder: "
       ACCEPT height_main
       COMPUTE TEMP_0 = radius_main * radius_main
       COMPUTE TEMP_1 = PI * TEMP_0
       COMPUTE TEMP_2 = TEMP_1 * height_main
       COMPUTE volume_main = TEMP_2
       DISPLAY "The volume of the cylinder is: "
       DISPLAY volume_main
       EXIT.


