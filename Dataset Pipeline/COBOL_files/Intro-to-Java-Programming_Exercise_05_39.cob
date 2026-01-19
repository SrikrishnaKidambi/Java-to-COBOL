       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_39.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_39_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_39_GLOBAL
       01  COMMISSION_SOUGHT_main PIC S9(5)V9(2).
       01  salesAmount_main PIC S9(5)V9(2).
       01  commission_main PIC S9(5)V9(2).
       01  balance_main    PIC S9(5)V9(2).
       01 TEMP_0 PIC S9(9).
       01 TEMP_1 PIC S9(9).
       01 TEMP_2 PIC S9(9).
       01 TEMP_3 PIC S9(9).
       01 TEMP_4 PIC S9(9).
       01 TEMP_5 PIC S9(9).
       01 TEMP_6 PIC S9(9).
       01 TEMP_7 PIC S9(9).
       01 TEMP_8 PIC S9(9).
       01 TEMP_9 PIC S9(9).
       01 TEMP_10 PIC S9(9).
       01 TEMP_11 PIC S9(9).
       01 TEMP_12 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Create a consstant value for commmission sought
      * Initialize accumulator to 0
       MOVE 0 TO salesAmount_main
       PERFORM WITH TEST AFTER
      * Set balance and commission to 0
       COMPUTE balance_main = 0
      * Increase sales amount by $0.01
       COMPUTE TEMP_0 = 0 + 01
       COMPUTE salesAmount_main = TEMP_0
      * If sales amount is $10,000.01 and above commission rate is 12%
       IF salesAmount_main > 10000
       COMPUTE TEMP_1 = salesAmount_main - 10000
       COMPUTE TEMP_2 = 0 * 12
       COMPUTE TEMP_3 = TEMP_1 + TEMP_2
       COMPUTE commission_main = TEMP_3
       END-IF
      * If sales amount is $5,000.01-$10,000 commission rate is 10%
       IF salesAmount_main > 5000
       COMPUTE TEMP_4 = balance_main - balance_main
       COMPUTE TEMP_5 = TEMP_4 - 5000
       COMPUTE TEMP_6 = 0 * 10
       COMPUTE TEMP_7 = TEMP_5 + TEMP_6
       COMPUTE commission_main = TEMP_7
       END-IF
      * If sales amount is $0.01-$5,000 commission rate is 8%
       IF salesAmount_main > 0
       COMPUTE TEMP_8 = 0 * 08
       COMPUTE TEMP_9 = balance_main + TEMP_8
       COMPUTE commission_main = TEMP_9
       END-IF
       END-PERFORM UNTIL NOT (commission_main < COMMISSION_SOUGHT_main)
      * Display results
       DIVIDE n BY salesAmount_main GIVING TEMP_11 REMAINDER TEMP_12
       COMPUTE TEMP_10 = TEMP_12
       DISPLAY TEMP_10 WITH NO ADVANCING
       EXIT.


