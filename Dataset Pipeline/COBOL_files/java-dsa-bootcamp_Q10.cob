       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_AREA_PARALLELOGRAM_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_AREA_PARALLELOGRAM_GLOBAL
       01  in_main         PIC X(100).
       01  base_main       PIC S9(5)V9(2).
       01  side_main       PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter the base of Parallelogram: "
       ACCEPT base_main
       DISPLAY "Enter the side of Parallelogram: "
       ACCEPT side_main
       DISPLAY "The perimeter of the parallelogram is : "
       COMPUTE TEMP_1 = base_main + side_main
       COMPUTE TEMP_2 = 2 * TEMP_1
       COMPUTE TEMP_0 = TEMP_2
       DISPLAY TEMP_0
       EXIT.


