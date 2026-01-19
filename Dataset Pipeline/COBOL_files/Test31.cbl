       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test31.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_ADD_CLASS_TESTSCOPED_GLOBAL
       01  x_add           PIC S9(5).
       01  y_add           PIC S9(5).
      * Variables for Scope:BLOCK_METHOD_ADD_CLASS_TESTSCOPED_GLOBAL
       01  z_add           PIC S9(5).
      * Variables for Scope:METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_TESTSCOPED_GLOBAL
       01  x_main          PIC S9(5).
       01  u_main          PIC S9(5).



       MAIN-PARA.
       MOVE 0 TO x_main
       MOVE 1 TO u_main
       MOVE x_main TO x_add
       MOVE u_main TO y_add
       PERFORM ADD-PARA

       add-PARA.
       ADD x_add TO y_add GIVING z_add
       DISPLAY "The addition is :"   z_add
       EXIT.
       STOP RUN.

