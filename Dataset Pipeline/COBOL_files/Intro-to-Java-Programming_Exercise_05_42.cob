       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_05_42.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_05_42_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_05_42_GLOBAL
       01  input_main      PIC X(100).
       01  commission_main PIC S9(5)V9(2).
       01  balance_main    PIC S9(5)V9(2).
       01  salesAmount_main PIC S9(5)V9(2).
       01  commissionSought_main PIC S9(5)V9(2).
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
       01 TEMP_13 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Let the user enter COMMISSION_SOUGHT
       DISPLAY "Enter the commission sought: " WITH NO ADVANCING
       ACCEPT commissionSought_main
      * Find the sales amount
       PERFORM VARYING salesAmount_main FROM 0 BY 0 UNTIL NOT (commission_main < commissionSought_main)
      * Set balance and commission to 0
       COMPUTE balance_main = 0
      * If salest amount is $10,000.01 and above commission rate is 12%
       IF salesAmount_main >= 10000.01
       COMPUTE TEMP_0 = salesAmount_main - 10000
       COMPUTE TEMP_1 = 0 * 12
       COMPUTE TEMP_2 = TEMP_0 + TEMP_1
       COMPUTE commission_main = TEMP_2
       END-IF
      * If salest amount is $5,000.01-$10,000 commission rate is 10%
       IF salesAmount_main >= 5000.01
       COMPUTE TEMP_3 = balance_main - balance_main
       COMPUTE TEMP_4 = TEMP_3 - 5000
       COMPUTE TEMP_5 = 0 * 10
       COMPUTE TEMP_6 = TEMP_4 + TEMP_5
       COMPUTE commission_main = TEMP_6
       END-IF
      * If salest amount is $0.01-$5,000 commission rate is 8%
       IF salesAmount_main >= 0.01
       COMPUTE TEMP_7 = 0 * 08
       COMPUTE TEMP_8 = balance_main + TEMP_7
       COMPUTE commission_main = TEMP_8
       END-IF
       END-PERFORM
      * Display results
       DIVIDE earn BY 0f GIVING TEMP_10 REMAINDER TEMP_11
       DIVIDE commissionSought_main BY salesAmount_main GIVING TEMP_12 REMAINDER TEMP_13
       COMPUTE TEMP_9 = TEMP_13
       DISPLAY TEMP_9 WITH NO ADVANCING
       EXIT.


