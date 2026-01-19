       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_HighestOccuringCharacter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_HIGHESTOCCURINGCHARACTER_CLASS_HIGHESTOCCURINGCHARACTER_GLOBAL
       01  inputString_highestOccuringCharacter PIC X(100).
      * Variables for Scope:BLOCK_METHOD_HIGHESTOCCURINGCHARACTER_CLASS_HIGHESTOCCURINGCHARACTER_GLOBAL
       01  count_highestOccuringCharacter PIC S9(5).
       01  idx_highestOccuringCharacter PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_HIGHESTOCCURINGCHARACTER_CLASS_HIGHESTOCCURINGCHARACTER_GLOBAL
       01  i_highestOccuringCharacter PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_HIGHESTOCCURINGCHARACTER_CLASS_HIGHESTOCCURINGCHARACTER_GLOBAL
       01  ch_highestOccuringCharacter PIC X(1).
       01  charcount_highestOccuringCharacter PIC S9(5).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_HIGHESTOCCURINGCHARACTER_CLASS_HIGHESTOCCURINGCHARACTER_GLOBAL
       01  j_highestOccuringCharacter PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       highestOccuringCharacter-PARA.
      * Write your code here
       COMPUTE TEMP_0 = inputString_highestOccuringCharacter.length()
       PERFORM VARYING i_highestOccuringCharacter FROM 0 BY 1 UNTIL NOT (i_highestOccuringCharacter < TEMP_0)
       MOVE FUNCTION CHAR(inputString_highestOccuringCharacter.charAt(i_highestOccuringCharacter)) TO ch_highestOccuringCharacter
       MOVE 1 TO charcount_highestOccuringCharacter
       COMPUTE TEMP_1 = inputString_highestOccuringCharacter.length()
       PERFORM VARYING j_highestOccuringCharacter FROM i_highestOccuringCharacter BY 1 UNTIL NOT (j_highestOccuringCharacter < TEMP_1)
       ADD i_highestOccuringCharacter TO 1 GIVING j_highestOccuringCharacter
       IF ch_highestOccuringCharacter = inputString_highestOccuringCharacter.charAt(j_highestOccuringCharacter)
       ADD 1 TO charcount_highestOccuringCharacter
       END-IF
       COMPUTE TEMP_1 = inputString_highestOccuringCharacter.length()
       END-PERFORM
       IF charcount_highestOccuringCharacter > count_highestOccuringCharacter
       MOVE charcount_highestOccuringCharacter TO count_highestOccuringCharacter
       MOVE i_highestOccuringCharacter TO idx_highestOccuringCharacter
       END-IF
       COMPUTE TEMP_0 = inputString_highestOccuringCharacter.length()
       END-PERFORM
      * System.out.println(inputString.charAt(idx));
       EXIT.


