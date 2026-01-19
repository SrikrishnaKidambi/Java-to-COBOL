       IDENTIFICATION DIVISION.
       PROGRAM-ID. SentenceSplitter.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  sc              PIC X(100).
       01  line1            PIC X(100).
       01  WORDS_-ARRAY   .
           05  words1       PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  i               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
      * Input from ODT is enabled
       DISPLAY "Enter a sentence of 5 words: " WITH NO ADVANCING
       ACCEPT line1
      * works only if the words array size is 5
       UNSTRING line1 DELIMITED BY " " INTO 
       words1(1), words1(2), words1(3), words1(4), words1(5)
       DISPLAY "Words in the sentence:"
       PERFORM VARYING i FROM 0 BY 1 UNTIL NOT (i < 5)
       DISPLAY words1(i + 1)
       END-PERFORM.
       EXIT.
       STOP RUN.

