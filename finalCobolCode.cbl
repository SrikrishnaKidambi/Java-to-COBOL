<<<<<<< HEAD
* COBOL code generated from Java files

=======
<<<<<<< HEAD
=======
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AllSubstrings.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_PRINTSUBSTRINGS_CLASS_TESTSCOPED_GLOBAL
       01  str_printSubstrings PIC X(100).
      * Variables for Scope:BLOCK_METHOD_PRINTSUBSTRINGS_CLASS_TESTSCOPED_GLOBAL
       01  count_printSubstrings PIC S9(5).
      * Variables for Scope:FOR_BLOCK_WHILE_BLOCK_METHOD_PRINTSUBSTRINGS_CLASS_TESTSCOPED_GLOBAL
       01  i_printSubstrings PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       printSubstrings-PARA.
       MOVE 1 TO count_printSubstrings
       COMPUTE TEMP_0 = str_printSubstrings.length()
       PERFORM UNTIL NOT (count_printSubstrings <= TEMP_0)
      * System.out.println("Printing substring with " + count + " characters");
       COMPUTE TEMP_1 = i_printSubstrings + count_printSubstrings
       COMPUTE TEMP_2 = str_printSubstrings.length()
       PERFORM VARYING i_printSubstrings FROM 0 BY 1 UNTIL NOT (TEMP_1 <= TEMP_2)
       COMPUTE TEMP_4 = i_printSubstrings + count_printSubstrings
       COMPUTE TEMP_3 = TEMP_4
       DISPLAY TEMP_3
       COMPUTE TEMP_1 = i_printSubstrings + count_printSubstrings
       COMPUTE TEMP_2 = str_printSubstrings.length()
       END-PERFORM
       ADD count_printSubstrings TO 1 GIVING count_printSubstrings
       COMPUTE TEMP_0 = str_printSubstrings.length()
       END-PERFORM
       EXIT.


>>>>>>> 28b8c928417ac931a4bf3d5a3b0f39cef431571d
>>>>>>> c10d241639b7f70aa110c02d55ca59f650018278
