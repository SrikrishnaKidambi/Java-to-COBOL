       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q5.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q5_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q5_GLOBAL
       01  scanner_main    PIC X(100).
       01  x1_main         PIC S9(5).
       01  x2_main         PIC S9(5).
       01  y1_main         PIC S9(5).
       01  y2_main         PIC S9(5).
       01  distance_main   PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Calculate Distance Between Two Points
      * Input from ODT is enabled
       MOVE 0 TO distance_main
       DISPLAY "Enter the coordinates of the first point (x1,y1): "
       ACCEPT x1_main
       ACCEPT y1_main
       DISPLAY "Enter the coordinates of the second point (x2,y2): "
       ACCEPT x2_main
       ACCEPT y2_main
      * using the distance formula
       COMPUTE TEMP_0 = x2_main - x1_main
       COMPUTE TEMP_1 = x2_main - x1_main
       COMPUTE TEMP_2 = TEMP_0 * TEMP_1
       COMPUTE TEMP_3 = y2_main - y1_main
       COMPUTE TEMP_4 = y2_main - y1_main
       COMPUTE TEMP_5 = TEMP_3 * TEMP_4
       COMPUTE TEMP_6 = TEMP_2 + TEMP_5
       COMPUTE distance_main = TEMP_6
       DISPLAY "The distance between the two points is "
       DISPLAY distance_main
       EXIT.


