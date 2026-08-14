       IDENTIFICATION DIVISION.
       PROGRAM-ID. Dog.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
       01  d_main          PIC X(100).
       01  TESTSCOPED-OBJ.
           05  TESTSCOPED-OBJ-NAME         PIC X(100).
           05  TESTSCOPED-OBJ-AGE          PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       TESTSCOPED-SPEAK-PARA.
       DISPLAY TESTSCOPED-OBJ-NAME
       EXIT.


       MAIN-PARA.
       MOVE "Rex" TO d_main.name
       DISPLAY d_main.age
       EXIT.


