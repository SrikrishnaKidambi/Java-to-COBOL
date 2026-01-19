       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_08.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_08_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_08_GLOBAL
       01  input_main      PIC X(100).
       01  highestScore_main PIC S9(5).
       01  numberOfStudents_main PIC S9(5).
       01  highestScoreName_main PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_08_GLOBAL
       01  i_main          PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_08_GLOBAL
       01  name_main       PIC X(100).
       01  score_main      PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create Scanner object
      * Input from ODT is enabled
      * Holds the hightest student score
       MOVE 0 TO highestScore_main
      * Holds the student name with highest score
       MOVE "" TO highestScoreName_main
      * Prompt the user to enter the number of students
       DISPLAY "Enter the number of students: " WITH NO ADVANCING
       ACCEPT numberOfStudents_main
      * Prompt the user to enter each student's name and score
       DISPLAY "Enter each student’s name and score"
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < numberOfStudents_main)
       DISPLAY "Student: " WITH NO ADVANCING
       COMPUTE TEMP_1 = i_main + 1
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY "\n   Name: " WITH NO ADVANCING
       ACCEPT name_main
       DISPLAY "   Score: " WITH NO ADVANCING
       ACCEPT score_main
      * Test if score is higher than highest score
       IF score_main > highestScore_main
       MOVE score_main TO highestScore_main
       MOVE name_main TO highestScoreName_main
       END-IF
       END-PERFORM
      * Display the name of the student with the highest score
       DISPLAY "Student with the highest score: "
       DISPLAY highestScoreName_main
       EXIT.


