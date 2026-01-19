       IDENTIFICATION DIVISION.
       PROGRAM-ID. java-dsa-bootcamp_Q22.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_Q22_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_Q22_GLOBAL
       01  sc_main         PIC X(100).
       01  ch_main         PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter the character: "
       ACCEPT ch_main
       IF ch_main = 'a'  OR  ch_main = 'e'  OR  ch_main = 'i'  OR  ch_main = 'o'  OR  ch_main = 'u'  OR  ch_main = 'A'  OR  ch_main = 'E'  OR  ch_main = 'I'  OR  ch_main = 'O'  OR  ch_main = 'U'
       DISPLAY "It is a Vowel."
       ELSE
       DISPLAY "It is a Consonant."
       END-IF
       EXIT.


