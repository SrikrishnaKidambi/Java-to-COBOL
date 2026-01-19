       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_10_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_10_GLOBAL
       01  set1_main       PIC X(100).
       01  set2_main       PIC X(100).
       01  set3_main       PIC X(100).
       01  set4_main       PIC X(100).
       01  set5_main       PIC X(100).
       01  s_main          PIC X(100).
       01  day_main        PIC S9(5).
       01  input_main      PIC X(100).
       01  answer_main     PIC X(1).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       STRING        " 1  3  5  7\n" DELIMITED BY SIZE 
       " 9 11 13 15\n" DELIMITED BY SIZE 
       "17 19 21 23\n" DELIMITED BY SIZE 
       "25 27 29 31" DELIMITED BY SIZE INTO set1_main
       STRING        " 2  3  6  7\n" DELIMITED BY SIZE 
       "10 11 14 15\n" DELIMITED BY SIZE 
       "18 19 22 23\n" DELIMITED BY SIZE 
       "26 27 30 31" DELIMITED BY SIZE INTO set2_main
       STRING        " 4  5  6  7\n" DELIMITED BY SIZE 
       "12 13 14 15\n" DELIMITED BY SIZE 
       "20 21 22 23\n" DELIMITED BY SIZE 
       "28 29 30 31" DELIMITED BY SIZE INTO set3_main
       STRING        " 8  9 10 11\n" DELIMITED BY SIZE 
       "12 13 14 15\n" DELIMITED BY SIZE 
       "24 25 26 27\n" DELIMITED BY SIZE 
       "28 29 30 31" DELIMITED BY SIZE INTO set4_main
       STRING        "16 17 18 19\n" DELIMITED BY SIZE 
       "20 21 22 23\n" DELIMITED BY SIZE 
       "24 25 26 27\n" DELIMITED BY SIZE 
       "28 29 30 31" DELIMITED BY SIZE INTO set5_main
       MOVE 0 TO day_main
      * Create a Scanner
      * Input from ODT is enabled
      * Prompt the user to answer questions
       DISPLAY "Is your birthday in Set1?\n" WITH NO ADVANCING
       DISPLAY set1_main WITH NO ADVANCING
       DISPLAY "\nEnter Y for Yes and N for No: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO answer_main
       COMPUTE TEMP_0 = answer_main
       IF TEMP_0 = 'Y'
       ADD day_main TO 1 GIVING day_main
       END-IF
      * Prompt the user to answer questions
       DISPLAY "Is your birthday in Set2?\n" WITH NO ADVANCING
       DISPLAY set2_main WITH NO ADVANCING
       DISPLAY "\nEnter Y for Yes and N for No: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO answer_main
       COMPUTE TEMP_1 = answer_main
       IF TEMP_1 = 'Y'
       ADD day_main TO 2 GIVING day_main
       END-IF
      * Prompt the user to answer questions
       DISPLAY "Is your birthday in Set3?\n" WITH NO ADVANCING
       DISPLAY set3_main WITH NO ADVANCING
       DISPLAY "\nEnter Y for Yes and N for No: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO answer_main
       COMPUTE TEMP_2 = answer_main
       IF TEMP_2 = 'Y'
       ADD day_main TO 4 GIVING day_main
       END-IF
      * Prompt the user to answer questions
       DISPLAY "Is your birthday in Set4?\n" WITH NO ADVANCING
       DISPLAY set4_main WITH NO ADVANCING
       DISPLAY "\nEnter Y for Yes and N for No: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO answer_main
       COMPUTE TEMP_3 = answer_main
       IF TEMP_3 = 'Y'
       ADD day_main TO 8 GIVING day_main
       END-IF
      * Prompt the user to answer questions
       DISPLAY "Is your birthday in Set5?\n" WITH NO ADVANCING
       DISPLAY set5_main WITH NO ADVANCING
       DISPLAY "\nEnter Y for Yes and N for No: " WITH NO ADVANCING
       ACCEPT s_main
       MOVE FUNCTION CHAR(s_main.charAt(0)) TO answer_main
       COMPUTE TEMP_4 = answer_main
       IF TEMP_4 = 'Y'
       ADD day_main TO 16 GIVING day_main
       END-IF
       DISPLAY "\nYour birthday is "
       DISPLAY day_main
       DISPLAY "!"
       EXIT.


