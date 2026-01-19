       IDENTIFICATION DIVISION.
       PROGRAM-ID. MenuDisplay.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_SHOWMENU_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  choice          PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       PERFORM showMenu-PARA
       EXIT.

       showMenu-PARA.
      * Input from ODT is enabled
       DISPLAY "1. Start"
       DISPLAY "2. Settings"
       DISPLAY "3. Exit"
       DISPLAY "Enter your choice: " WITH NO ADVANCING
       ACCEPT choice
       EVALUATE choice
       WHEN 1
       DISPLAY "Starting..."
       WHEN 2
       DISPLAY "Opening Settings..."
       WHEN 3
       DISPLAY "Exiting..."
       WHEN OTHER
       DISPLAY "Invalid Choice"
       END-EVALUATE
       EXIT.
       STOP RUN.

