       IDENTIFICATION DIVISION.
       PROGRAM-ID. CodingNinjas_Java_DSA_CompressString.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_GETCOMPRESSEDSTRING_CLASS_COMPRESSSTRING_GLOBAL
       01  input_getCompressedString PIC X(100).
      * Variables for Scope:BLOCK_METHOD_GETCOMPRESSEDSTRING_CLASS_COMPRESSSTRING_GLOBAL
       01  output_getCompressedString PIC X(100).
       01  count_getCompressedString PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_GETCOMPRESSEDSTRING_CLASS_COMPRESSSTRING_GLOBAL
       01  i_getCompressedString PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       getCompressedString-PARA.
      * Your code goes here.
       MOVE 1 TO count_getCompressedString
       COMPUTE TEMP_0 = input_getCompressedString.length()
       PERFORM VARYING i_getCompressedString FROM 1 BY 1 UNTIL NOT (i_getCompressedString < TEMP_0)
       COMPUTE TEMP_1 = i_getCompressedString
       IF TEMP_1 != input_getCompressedString.charAt(i_getCompressedString - 1)
      * System.out.println("Count of " + input.charAt(i-1) + " = " + count);
       IF count_getCompressedString > 1
       COMPUTE TEMP_2 = toString + count_getCompressedString
       COMPUTE output_getCompressedString = TEMP_2
       END-IF
       COMPUTE TEMP_3 = charAt + i_getCompressedString
       COMPUTE output_getCompressedString = TEMP_3
       MOVE 1 TO count_getCompressedString
       ELSE
       ADD count_getCompressedString TO 1 GIVING count_getCompressedString
       END-IF
       COMPUTE TEMP_0 = input_getCompressedString.length()
       END-PERFORM
       IF count_getCompressedString > 1
       COMPUTE TEMP_4 = toString + count_getCompressedString
       COMPUTE output_getCompressedString = TEMP_4
       END-IF
      * System.out.println(output);
       EXIT.


