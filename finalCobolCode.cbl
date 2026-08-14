       IDENTIFICATION DIVISION.
       PROGRAM-ID. Animal.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_MAIN_GLOBAL
       01  args_main-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
       01  args_main-MAX   PIC S9(9) VALUE 100.
      * Class record: Animal
       01  ANIMAL-OBJ.
           05  ANIMAL-OBJ-NAME         PIC X(100).
      * Class record: Dog
       01  DOG-OBJ.
           05  DOG-OBJ-NAME         PIC X(100).
           05  DOG-OBJ-AGE          PIC S9(9).
      * Object instance records
       01  DOG-D-INST.
           05  DOG-D-INST-NAME         PIC X(100).
           05  DOG-D-INST-AGE          PIC S9(9).
      * OOP method parameters


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       ANIMAL-SPEAK-PARA.
       DISPLAY ANIMAL-OBJ-NAME
       EXIT.


       DOG-SPEAK-PARA.
       DISPLAY DOG-OBJ-NAME
       DISPLAY DOG-OBJ-AGE
       EXIT.


       MAIN-PARA.
       INITIALIZE DOG-D-INST
       MOVE "Rex" TO DOG-D-INST-NAME
       MOVE 3 TO DOG-D-INST-AGE
       MOVE DOG-D-INST TO DOG-OBJ
       PERFORM DOG-SPEAK-PARA
       MOVE DOG-OBJ TO DOG-D-INST
       EXIT.


