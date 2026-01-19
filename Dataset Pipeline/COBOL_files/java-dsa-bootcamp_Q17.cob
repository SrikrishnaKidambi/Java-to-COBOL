       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q17.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q17_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q17_GLOBAL
       01  sc_main         PIC X(100).
       01  radius_main     PIC S9(5)V9(2).
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
      * volume of sphere
      * Input from ODT is enabled
       DISPLAY "Enter the radius of sphere"
       ACCEPT radius_main
       DISPLAY "The volume of sphere is "
       COMPUTE TEMP_1 = Math * PI
       COMPUTE TEMP_2 = TEMP_1 * radius_main
       COMPUTE TEMP_3 = TEMP_2 * radius_main
       COMPUTE TEMP_4 = TEMP_3 * radius_main
       COMPUTE TEMP_5 = TEMP_4 / 3
       COMPUTE TEMP_0 = TEMP_5
       DISPLAY TEMP_0
       EXIT.


