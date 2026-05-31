       IDENTIFICATION DIVISION.
<<<<<<< HEAD
       PROGRAM-ID. TestString.
=======
       PROGRAM-ID. Test.
>>>>>>> d0101356c30f8ca04a5b8847da13c60c00a185d3


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
<<<<<<< HEAD
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  s_main          PIC X(100).
=======
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  a_main          PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
>>>>>>> d0101356c30f8ca04a5b8847da13c60c00a185d3


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
<<<<<<< HEAD
       MOVE "Hello" TO s_main
       DISPLAY s_main.length()
       DISPLAY s_main.toUpperCase()
       DISPLAY s_main.charAt(1)
       DISPLAY s_main.substring(1, 3)
=======
       MOVE 5 TO a_main
       DISPLAY "Position in alphabet: "
       COMPUTE TEMP_1 = ABS - 5
       COMPUTE TEMP_2 = FUNCTION + TEMP_1
       COMPUTE TEMP_0 = TEMP_2
       DISPLAY TEMP_0
>>>>>>> d0101356c30f8ca04a5b8847da13c60c00a185d3
       EXIT.


