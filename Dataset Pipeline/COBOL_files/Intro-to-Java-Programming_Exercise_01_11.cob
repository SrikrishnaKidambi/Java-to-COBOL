       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_01_11.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_01_11_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
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
       01 TEMP_14 PIC S9(9).
       01 TEMP_15 PIC S9(9).
       01 TEMP_16 PIC S9(9).
       01 TEMP_17 PIC S9(9).
       01 TEMP_18 PIC S9(9).
       01 TEMP_19 PIC S9(9).
       01 TEMP_20 PIC S9(9).
       01 TEMP_21 PIC S9(9).
       01 TEMP_22 PIC S9(9).
       01 TEMP_23 PIC S9(9).
       01 TEMP_24 PIC S9(9).
       01 TEMP_25 PIC S9(9).
       01 TEMP_26 PIC S9(9).
       01 TEMP_27 PIC S9(9).
       01 TEMP_28 PIC S9(9).
       01 TEMP_29 PIC S9(9).
       01 TEMP_30 PIC S9(9).
       01 TEMP_31 PIC S9(9).
       01 TEMP_32 PIC S9(9).
       01 TEMP_33 PIC S9(9).
       01 TEMP_34 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
       DISPLAY "Population projection"
       DISPLAY "Current population: 312032486"
       DISPLAY "One birth every 7 seconds."
       DISPLAY "One death every 13 seconds."
       DISPLAY "One new immigrant every 45 seconds."
       DISPLAY "Yearly Population projection formula: "
       DISPLAY "                   - (deaths per year)"
       DISPLAY "
       DISPLAY (new immigrants per year)
       DISPLAY "                   * year."
       DISPLAY "Year 1 projection: "
       DISPLAY 312032486
       COMPUTE TEMP_1 = 31536000 / 7
       COMPUTE TEMP_2 = 31536000 / 13
       COMPUTE TEMP_3 = TEMP_1 - TEMP_2
       COMPUTE TEMP_4 = 31536000 / 45
       COMPUTE TEMP_5 = TEMP_3 + TEMP_4
       COMPUTE TEMP_6 = TEMP_5 * 1
       COMPUTE TEMP_0 = TEMP_6
       DISPLAY TEMP_0
       DISPLAY "Year 2 projection: "
       DISPLAY 312032486
       COMPUTE TEMP_8 = 31536000 / 7
       COMPUTE TEMP_9 = 31536000 / 13
       COMPUTE TEMP_10 = TEMP_8 - TEMP_9
       COMPUTE TEMP_11 = 31536000 / 45
       COMPUTE TEMP_12 = TEMP_10 + TEMP_11
       COMPUTE TEMP_13 = TEMP_12 * 2
       COMPUTE TEMP_7 = TEMP_13
       DISPLAY TEMP_7
       DISPLAY "Year 3 projection: "
       DISPLAY 312032486
       COMPUTE TEMP_15 = 31536000 / 7
       COMPUTE TEMP_16 = 31536000 / 13
       COMPUTE TEMP_17 = TEMP_15 - TEMP_16
       COMPUTE TEMP_18 = 31536000 / 45
       COMPUTE TEMP_19 = TEMP_17 + TEMP_18
       COMPUTE TEMP_20 = TEMP_19 * 3
       COMPUTE TEMP_14 = TEMP_20
       DISPLAY TEMP_14
       DISPLAY "Year 4 projection: "
       DISPLAY 312032486
       COMPUTE TEMP_22 = 31536000 / 7
       COMPUTE TEMP_23 = 31536000 / 13
       COMPUTE TEMP_24 = TEMP_22 - TEMP_23
       COMPUTE TEMP_25 = 31536000 / 45
       COMPUTE TEMP_26 = TEMP_24 + TEMP_25
       COMPUTE TEMP_27 = TEMP_26 * 4
       COMPUTE TEMP_21 = TEMP_27
       DISPLAY TEMP_21
       DISPLAY "Year 5 projection: "
       DISPLAY 312032486
       COMPUTE TEMP_29 = 31536000 / 7
       COMPUTE TEMP_30 = 31536000 / 13
       COMPUTE TEMP_31 = TEMP_29 - TEMP_30
       COMPUTE TEMP_32 = 31536000 / 45
       COMPUTE TEMP_33 = TEMP_31 + TEMP_32
       COMPUTE TEMP_34 = TEMP_33 * 5
       COMPUTE TEMP_28 = TEMP_34
       DISPLAY TEMP_28
       EXIT.


