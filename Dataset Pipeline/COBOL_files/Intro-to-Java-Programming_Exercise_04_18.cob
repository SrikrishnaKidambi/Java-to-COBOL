       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_18.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_18_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_18_GLOBAL
       01  input_main      PIC X(100).
       01  str_main        PIC X(100).
       01  m_main          PIC X(1).
       01  s_main          PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter two characters
       DISPLAY "Enter two characters: " WITH NO ADVANCING
       ACCEPT str_main
      * Extract major and status from string
       MOVE FUNCTION CHAR(Character.toUpperCase(str_main.charAt(0))) TO m_main
       MOVE FUNCTION CHAR(str_main.charAt(1)) TO s_main
      * Display the major and status represented in the character
       EVALUATE m_main
       WHEN 'M'
       DISPLAY "Mathematics " WITH NO ADVANCING
       WHEN 'C'
       DISPLAY "Computer Science " WITH NO ADVANCING
       WHEN 'I'
       DISPLAY "Information Technology" WITH NO ADVANCING
       WHEN OTHER
       DISPLAY "Invalid input"
       STOP RUN
       END-EVALUATE
       EVALUATE s_main
       WHEN '1'
       DISPLAY "Freshman"
       WHEN '2'
       DISPLAY "Sophomore"
       WHEN '3'
       DISPLAY "Junior"
       WHEN '4'
       DISPLAY "Senior"
       WHEN OTHER
       DISPLAY "Invalid input"
       END-EVALUATE
       EXIT.


