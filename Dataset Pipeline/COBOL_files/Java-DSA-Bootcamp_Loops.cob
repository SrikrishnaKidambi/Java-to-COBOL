       IDENTIFICATION DIVISION.
       PROGRAM-ID. Java-DSA-Bootcamp_Loops.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_LOOPS_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_LOOPS_GLOBAL
       01  in_main         PIC X(100).
       01  num_main        PIC S9(5).
       01  n_main          PIC S9(5).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Syntax of for loops:

            for (initialisation; condition; increment/decrement) {
                // body
            }
      * Q: Print numbers from 1 to 5
      * for (int num = 1; num <= 5; num += 2) {
      * System.out.println(num);
      * }
      * print numbers from 1 to n
      * Input from ODT is enabled
      * int n = in.nextInt();
      * for (int num = 1; num <= n; num++) {
      * //            System.out.print(num + " ");
      * System.out.println("Hello World");
      * }
      * while loops
      * Syntax:
            while (condition) {
                // body
            }
      * for (int num = 1; num <= 5; num += 2) {
      * System.out.println(num);
      * }
       MOVE 1 TO num_main
       PERFORM UNTIL NOT (num_main <= 5)
      * System.out.println(num);
       ADD num_main TO 1 GIVING num_main
       END-PERFORM
      * do while
      * do {
                // body
            } while (condition);
       MOVE 1 TO n_main
       PERFORM WITH TEST AFTER
       DISPLAY "Hello World"
       END-PERFORM UNTIL NOT (n_main NOT = 1)
       EXIT.


