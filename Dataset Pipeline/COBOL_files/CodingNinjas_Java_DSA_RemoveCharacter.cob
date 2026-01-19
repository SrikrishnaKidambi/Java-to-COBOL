       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_RemoveCharacter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_REMOVEALLOCCURRENCESOFCHAR_CLASS_REMOVECHARACTER_GLOBAL
       01  input_removeAllOccurrencesOfChar PIC X(100).
       01  c_removeAllOccurrencesOfChar PIC X(1).
      * Variables for Scope:BLOCK_METHOD_REMOVEALLOCCURRENCESOFCHAR_CLASS_REMOVECHARACTER_GLOBAL
       01  newstr_removeAllOccurrencesOfChar PIC X(100).
      * Variables for Scope:FOR_BLOCK_METHOD_REMOVEALLOCCURRENCESOFCHAR_CLASS_REMOVECHARACTER_GLOBAL
       01  i_removeAllOccurrencesOfChar PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       removeAllOccurrencesOfChar-PARA.
      * Write your code here
       MOVE "" TO newstr_removeAllOccurrencesOfChar
       COMPUTE TEMP_0 = input_removeAllOccurrencesOfChar.length()
       PERFORM VARYING i_removeAllOccurrencesOfChar FROM 0 BY 1 UNTIL NOT (i_removeAllOccurrencesOfChar < TEMP_0)
       COMPUTE TEMP_1 = i_removeAllOccurrencesOfChar
       IF TEMP_1 != c_removeAllOccurrencesOfChar
       COMPUTE TEMP_2 = charAt + i_removeAllOccurrencesOfChar
       COMPUTE newstr_removeAllOccurrencesOfChar = TEMP_2
       END-IF
       COMPUTE TEMP_0 = input_removeAllOccurrencesOfChar.length()
       END-PERFORM
       EXIT.


