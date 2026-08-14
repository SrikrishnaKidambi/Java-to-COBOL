       IDENTIFICATION DIVISION.
       PROGRAM-ID. Dog.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  d_main          PIC X(100).
      * Class record: TestScoped
       01  TESTSCOPED-OBJ.
           05  TESTSCOPED-OBJ-NAME         PIC X(100).
           05  TESTSCOPED-OBJ-AGE          PIC S9(9).
      * Object instance records
      * OOP method parameters


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


