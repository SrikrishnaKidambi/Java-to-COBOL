       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Que12.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_QUE12_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_QUE12_GLOBAL
       01  sc_main         PIC X(100).
       01  marks_main      PIC S9(5)V9(2).
       01  sum_main        PIC S9(5)V9(2).
       01  average_main    PIC S9(5)V9(2).
       01  num_main        PIC S9(5).
       01 TEMP_0 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter your markss: "
       ACCEPT marks_main
       MOVE 0 TO sum_main
       MOVE 0 TO num_main
       COMPUTE TEMP_0 = -1
       PERFORM UNTIL NOT (marks_main NOT = TEMP_0)
       ADD sum_main TO marks_main GIVING sum_main
       ADD 1 TO num_main
       ACCEPT marks_main
       COMPUTE TEMP_0 = -1
       END-PERFORM
       DIVIDE sum_main BY num_main GIVING average_main
       DISPLAY "Average: "
       DISPLAY average_main
       EXIT.


