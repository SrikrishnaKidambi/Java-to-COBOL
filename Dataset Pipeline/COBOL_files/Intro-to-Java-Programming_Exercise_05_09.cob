       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_09.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_09_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_09_GLOBAL
       01  input_main      PIC X(100).
       01  numberOfStudents_main PIC S9(5).
       01  score_main      PIC S9(5).
       01  highest_main    PIC S9(5).
       01  secondHigest_main PIC S9(5).
       01  name_main       PIC X(100).
       01  student1_main   PIC X(100).
       01  student2_main   PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_09_GLOBAL
       01  i_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a Scanner
      * Input from ODT is enabled
      * Prompt the user to enter the number of students
       DISPLAY "Enter the number of students: " WITH NO ADVANCING
       ACCEPT numberOfStudents_main
      * Prompt the user to enter each students' name and score
       DISPLAY "Enter each students' name and score:"
       PERFORM VARYING i_main FROM 0 BY 1 UNTIL NOT (i_main < numberOfStudents_main)
       DISPLAY "Student: " WITH NO ADVANCING
       COMPUTE TEMP_1 = i_main + 1
       COMPUTE TEMP_0 = TEMP_1
       DISPLAY TEMP_0 WITH NO ADVANCING
       DISPLAY "\n   Name: " WITH NO ADVANCING
       ACCEPT name_main
       DISPLAY "   Score: " WITH NO ADVANCING
       ACCEPT score_main
       IF i_main = 0
      * Make the first student the highest scoring student so far
       MOVE score_main TO highest_main
       MOVE name_main TO student1_main
       ELSE
       IF i_main = 1  AND  score_main > highest_main
      * Second student entered scored
      * higher than first student
       MOVE highest_main TO secondHigest_main
       MOVE score_main TO highest_main
       MOVE student1_main TO student2_main
       MOVE name_main TO student1_main
       ELSE
       IF i_main = 1
      * Second student entered scored
      * lower than first student
       MOVE score_main TO secondHigest_main
       MOVE name_main TO student2_main
       ELSE
       IF i_main > 1  AND  score_main > highest_main  AND  score_main > secondHigest_main
      * Last student entered has the highest score
       MOVE highest_main TO secondHigest_main
       MOVE student1_main TO student2_main
       MOVE score_main TO highest_main
       MOVE name_main TO student1_main
       ELSE
       IF i_main > 1  AND  score_main > secondHigest_main
      * Last student entered has the second highest score
       MOVE name_main TO student2_main
       MOVE score_main TO secondHigest_main
       END-IF
       END-IF
       END-IF
       END-IF
       END-IF
       END-PERFORM
      * Display the student with the hightest score
      * and the student with the second-hightest score.
       DISPLAY "Higest scoring student: "
       DISPLAY student1_main
       DISPLAY "\nSecond Higest scoring student: "
       DISPLAY student2_main
       EXIT.


