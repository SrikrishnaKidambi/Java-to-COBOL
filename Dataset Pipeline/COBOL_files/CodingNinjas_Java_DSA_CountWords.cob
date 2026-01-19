       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_CountWords.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_COUNTWORDS_CLASS_COUNTWORDS_GLOBAL
       01  str_countWords  PIC X(100).
      * Variables for Scope:BLOCK_METHOD_COUNTWORDS_CLASS_COUNTWORDS_GLOBAL
       01  count_countWords PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_COUNTWORDS_CLASS_COUNTWORDS_GLOBAL
       01  i_countWords    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       countWords-PARA.
       MOVE 0 TO count_countWords
       COMPUTE TEMP_0 = str_countWords.length()
       PERFORM VARYING i_countWords FROM 0 BY 1 UNTIL NOT (i_countWords < TEMP_0)
       COMPUTE TEMP_1 = i_countWords
       IF TEMP_1 = ' '
       ADD 1 TO count_countWords
       END-IF
       COMPUTE TEMP_0 = str_countWords.length()
       END-PERFORM
      * System.out.println(count+1);
       PERFORM return-PARA
       EXIT.


