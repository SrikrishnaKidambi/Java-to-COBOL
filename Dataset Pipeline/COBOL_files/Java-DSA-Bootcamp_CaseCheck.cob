       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_CaseCheck.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_CASECHECK_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_CASECHECK_GLOBAL
       01  in_main         PIC X(100).
       01  ch_main         PIC X(1).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
       MOVE FUNCTION CHAR(in_main.next().trim().charAt(0)) TO ch_main
       IF ch_main >= 'a'  AND  ch_main <= 'z'
       DISPLAY "Lowercase"
       ELSE
       DISPLAY "Uppercase"
       END-IF
       EXIT.


