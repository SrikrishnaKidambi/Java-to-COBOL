       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test3.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_TEST_GLOBAL
       01  ARGS_-ARRAY    .
           05  args         PIC X(10) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TEST_GLOBAL
       01  fullname        PIC X(10).
       01  PARTS_-ARRAY   .
           05  parts        PIC X(10) OCCURS 100 TIMES.
       01  firstname       PIC X(10).
       01  lastname        PIC X(10).
       01  updatedFirstname PIC X(10).
       01  a               PIC S9(5).


       PROCEDURE DIVISION.


       MAIN-PARA.
       MOVE "Srikrishna Kidambi" TO fullname.
       UNSTRING fullname DELIMITED BY " " INTO parts(1), parts(2).
       MOVE parts(1) TO firstname.
       MOVE parts(2) TO lastname.
       STRING        "Venkata " DELIMITED BY SPACE 
       parts(1) DELIMITED BY SPACE 
       'd'  DELIMITED BY SPACE INTO updatedFirstname.
       COMPUTE a = 8 + 7 + 9.
       DISPLAY "Full name: " fullname.
       DISPLAY "First name: " firstname.
       DISPLAY "Last name: " lastname.
       DISPLAY "Updated First name: " updatedFirstname.
       EXIT.
       STOP RUN.

