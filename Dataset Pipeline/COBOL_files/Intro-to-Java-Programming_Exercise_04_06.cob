       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_04_06.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_04_06_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_04_06_GLOBAL
       01  RADIUS_main     PIC S9(5)V9(2).
       01  angle1_main     PIC S9(5)V9(2).
       01  angle2_main     PIC S9(5)V9(2).
       01  angle3_main     PIC S9(5)V9(2).
       01  x1_main         PIC S9(5)V9(2).
       01  y1_main         PIC S9(5)V9(2).
       01  x2_main         PIC S9(5)V9(2).
       01  y2_main         PIC S9(5)V9(2).
       01  x3_main         PIC S9(5)V9(2).
       01  y3_main         PIC S9(5)V9(2).
       01  a_main          PIC S9(5)V9(2).
       01  b_main          PIC S9(5)V9(2).
       01  c_main          PIC S9(5)V9(2).
       01  angleA_main     PIC S9(5)V9(2).
       01  angleB_main     PIC S9(5)V9(2).
       01  angleC_main     PIC S9(5)V9(2).
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
       01 TEMP_35 PIC S9(9).
       01 TEMP_36 PIC S9(9).
       01 TEMP_37 PIC S9(9).
       01 TEMP_38 PIC S9(9).
       01 TEMP_39 PIC S9(9).
       01 TEMP_40 PIC S9(9).
       01 TEMP_41 PIC S9(9).
       01 TEMP_42 PIC S9(9).
       01 TEMP_43 PIC S9(9).
       01 TEMP_44 PIC S9(9).
       01 TEMP_45 PIC S9(9).
       01 TEMP_46 PIC S9(9).
       01 TEMP_47 PIC S9(9).
       01 TEMP_48 PIC S9(9).
       01 TEMP_49 PIC S9(9).
       01 TEMP_50 PIC S9(9).
       01 TEMP_51 PIC S9(9).
       01 TEMP_52 PIC S9(9).
       01 TEMP_53 PIC S9(9).
       01 TEMP_54 PIC S9(9).
       01 TEMP_55 PIC S9(9).
       01 TEMP_56 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Generate random angle in radians between 0 and 2PI
       COMPUTE TEMP_0 = Math * PI
       COMPUTE TEMP_1 = 2 * TEMP_0
       COMPUTE angle1_main = TEMP_1
       COMPUTE TEMP_2 = Math * PI
       COMPUTE TEMP_3 = 2 * TEMP_2
       COMPUTE angle2_main = TEMP_3
       COMPUTE TEMP_4 = Math * PI
       COMPUTE TEMP_5 = 2 * TEMP_4
       COMPUTE angle3_main = TEMP_5
      * Get x and y
       COMPUTE TEMP_6 = cos * angle1_main
       COMPUTE x1_main = TEMP_6
       COMPUTE TEMP_7 = SIN * angle1_main
       COMPUTE y1_main = TEMP_7
       COMPUTE TEMP_8 = cos * angle2_main
       COMPUTE x2_main = TEMP_8
       COMPUTE TEMP_9 = SIN * angle2_main
       COMPUTE y2_main = TEMP_9
       COMPUTE TEMP_10 = cos * angle3_main
       COMPUTE x3_main = TEMP_10
       COMPUTE TEMP_11 = SIN * angle3_main
       COMPUTE y3_main = TEMP_11
      * Compute three sides
       COMPUTE TEMP_12 = x3_main - 2
       COMPUTE TEMP_13 = y3_main - 2
       COMPUTE TEMP_14 = y2_main + TEMP_13
       COMPUTE a_main = TEMP_14
       COMPUTE TEMP_15 = x3_main - 2
       COMPUTE TEMP_16 = y3_main - 2
       COMPUTE TEMP_17 = y1_main + TEMP_16
       COMPUTE b_main = TEMP_17
       COMPUTE TEMP_18 = x2_main - 2
       COMPUTE TEMP_19 = y2_main - 2
       COMPUTE TEMP_20 = y1_main + TEMP_19
       COMPUTE c_main = TEMP_20
      * Compute three angles
       COMPUTE TEMP_21 = a_main * a_main
       COMPUTE TEMP_22 = b_main * b_main
       COMPUTE TEMP_23 = TEMP_21 - TEMP_22
       COMPUTE TEMP_24 = c_main * c_main
       COMPUTE TEMP_25 = TEMP_23 - TEMP_24
       COMPUTE TEMP_26 = 2 * b_main
       COMPUTE TEMP_27 = TEMP_26 * c_main
       COMPUTE TEMP_28 = TEMP_25 - TEMP_27
       COMPUTE TEMP_29 = acos / TEMP_28
       COMPUTE angleA_main = TEMP_29
       COMPUTE TEMP_30 = b_main * b_main
       COMPUTE TEMP_31 = a_main * a_main
       COMPUTE TEMP_32 = TEMP_30 - TEMP_31
       COMPUTE TEMP_33 = c_main * c_main
       COMPUTE TEMP_34 = TEMP_32 - TEMP_33
       COMPUTE TEMP_35 = 2 * a_main
       COMPUTE TEMP_36 = TEMP_35 * c_main
       COMPUTE TEMP_37 = TEMP_34 - TEMP_36
       COMPUTE TEMP_38 = acos / TEMP_37
       COMPUTE angleB_main = TEMP_38
       COMPUTE TEMP_39 = c_main * c_main
       COMPUTE TEMP_40 = b_main * b_main
       COMPUTE TEMP_41 = TEMP_39 - TEMP_40
       COMPUTE TEMP_42 = a_main * a_main
       COMPUTE TEMP_43 = TEMP_41 - TEMP_42
       COMPUTE TEMP_44 = 2 * a_main
       COMPUTE TEMP_45 = TEMP_44 * b_main
       COMPUTE TEMP_46 = TEMP_43 - TEMP_45
       COMPUTE TEMP_47 = acos / TEMP_46
       COMPUTE angleC_main = TEMP_47
      * Display results
       DISPLAY "The three angles are "
       COMPUTE TEMP_49 = angleA_main * 100
       COMPUTE TEMP_50 = 100 / 0
       COMPUTE TEMP_48 = TEMP_50
       DISPLAY TEMP_48
       DISPLAY " "
       COMPUTE TEMP_52 = angleB_main * 100
       COMPUTE TEMP_53 = 100 / 0
       COMPUTE TEMP_51 = TEMP_53
       DISPLAY TEMP_51
       DISPLAY " "
       COMPUTE TEMP_55 = angleC_main * 100
       COMPUTE TEMP_56 = 100 / 0
       COMPUTE TEMP_54 = TEMP_56
       DISPLAY TEMP_54
       EXIT.


