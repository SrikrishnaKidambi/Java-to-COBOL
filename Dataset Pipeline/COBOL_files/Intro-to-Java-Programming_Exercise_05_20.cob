       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_20.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_20_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_20_GLOBAL
       01  NUMBER_OF_PRIMES_PER_LINE_main PIC S9(5).
       01  count_main      PIC S9(5).
      * Variables for Scope:FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_20_GLOBAL
       01  number_main     PIC S9(5).
      * Variables for Scope:BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_20_GLOBAL
       01  isPrime_main    PIC X(1).
      * Variables for Scope:FOR_BLOCK_FOR_BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_20_GLOBAL
       01  divisor_main    PIC S9(5).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Display 8 per line
      * Count the number of prime numbers
       MOVE 0 TO count_main
       DISPLAY "The prime numbers between 2 and 1,000, inclusive are \n"
      * Repeatedly find prime numbers
       PERFORM VARYING number_main FROM 2 BY 1 UNTIL NOT (number_main <= 1000)
      * Assume the number is prime
      * Is the current number prime?
       MOVE 'Y' TO isPrime_main
      * Test whether number is prime
       COMPUTE TEMP_0 = number_main / 2
       PERFORM VARYING divisor_main FROM 2 BY 1 UNTIL NOT (divisor_main <= TEMP_0)
       DIVIDE number_main BY divisor_main GIVING TEMP_1 REMAINDER TEMP_1
       IF TEMP_1 = 0
      * If true, number is not prime
      * Set isPrime to false
       MOVE 'N' TO isPrime_main
      * Exit the for loop
       EXIT PERFORM
       END-IF
       COMPUTE TEMP_0 = number_main / 2
       END-PERFORM
      * Display the prime number and increase the count
       IF isPrime_main
      * Increase the count
       ADD 1 TO count_main
       DIVIDE count_main BY NUMBER_OF_PRIMES_PER_LINE_main GIVING TEMP_2 REMAINDER TEMP_2
       IF TEMP_2 = 0
      * Display the number and advance to the new line
       DISPLAY number_main
       ELSE
       DISPLAY number_main WITH NO ADVANCING
       DISPLAY " " WITH NO ADVANCING
       END-IF
       END-IF
       END-PERFORM
       EXIT.


