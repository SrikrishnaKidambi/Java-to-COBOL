       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestCase10.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:BLOCK_METHOD_DISPLAYRANDOMCLASSIFICATION_CLASS_TEST_GLOBAL
       01  rand_displayRandomClassification PIC S9(5)V9(2).
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.


       PROCEDURE DIVISION.


       displayRandomClassification-PARA.
       COMPUTE rand_displayRandomClassification = FUNCTION RANDOM()
       IF rand_displayRandomClassification < 0.5
       DISPLAY "Random value "   rand_displayRandomClassification   
       " is less than 0.5"
       ELSE
       DISPLAY "Random value "   rand_displayRandomClassification 
         " is 0.5 or more"
       END-IF.
       GOBACK
       EXIT.

       MAIN-PARA.
       PERFORM DISPLAYRANDOMCLASSIFICATION-PARA
       EXIT.
       STOP RUN.

