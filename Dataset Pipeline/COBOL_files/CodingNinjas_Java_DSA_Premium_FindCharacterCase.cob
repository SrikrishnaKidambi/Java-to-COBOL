       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_Premium_FindCharacterCase.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_FINDCHARACTERCASE_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_FINDCHARACTERCASE_GLOBAL
       01  s_main          PIC X(100).
       01  ch_main         PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * TODO Auto-generated method stub
      * Input from ODT is enabled
       ACCEPT ch_main
       IF ch_main >= 'a'  AND  ch_main <= 'z'
       DISPLAY "0"
       ELSE
       IF ch_main >= 'A'  AND  ch_main <= 'Z'
       DISPLAY "1"
       ELSE
       DISPLAY "-1"
       END-IF
       END-IF
       EXIT.


