       IDENTIFICATION DIVISION.
       PROGRAM-ID. MenuNestedSwitch.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(10).
       01  choice          PIC S9(5).
       01  fileChoice      PIC S9(5).
       01  editChoice      PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Main Menu:"
       DISPLAY "1. File"
       DISPLAY "2. Edit"
       DISPLAY "Enter your choice: " WITH NO ADVANCING
       ACCEPT choice
       EVALUATE choice
       WHEN 1
       DISPLAY "File Menu:"
       DISPLAY "1. New"
       DISPLAY "2. Open"
       ACCEPT fileChoice
       EVALUATE fileChoice
       WHEN 1
       DISPLAY "New File Created"
       WHEN 2
       DISPLAY "File Opened"
       WHEN OTHER
       DISPLAY "Invalid file menu option"
       END-EVALUATE
       WHEN 2
       DISPLAY "Edit Menu:"
       DISPLAY "1. Cut"
       DISPLAY "2. Paste"
       ACCEPT editChoice
       EVALUATE editChoice
       WHEN 1
       DISPLAY "Cut executed"
       WHEN 2
       DISPLAY "Paste executed"
       WHEN OTHER
       DISPLAY "Invalid edit menu option"
       END-EVALUATE
       WHEN OTHER
       DISPLAY "Invalid main menu choice"
       END-EVALUATE
       EXIT.
       STOP RUN.

