       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q20.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q20_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q20_GLOBAL
       01  in_main         PIC X(100).
       01  radius_main     PIC S9(5)V9(2).
       01  height_main     PIC S9(5)V9(2).
       01  area_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * total surface area of cylinder
      * Input from ODT is enabled
       DISPLAY "Enter the radius of the cylinder: " WITH NO ADVANCING
       ACCEPT radius_main
       DISPLAY "Enter the height of the cylinder: " WITH NO ADVANCING
       ACCEPT height_main
       COMPUTE TEMP_0 = Math * PI
       COMPUTE TEMP_1 = TEMP_0 * radius_main
       COMPUTE TEMP_2 = TEMP_1 * height_main
       COMPUTE area_main = TEMP_2
       DISPLAY "The surface area of the cylinder is "
       DISPLAY area_main
       EXIT.


