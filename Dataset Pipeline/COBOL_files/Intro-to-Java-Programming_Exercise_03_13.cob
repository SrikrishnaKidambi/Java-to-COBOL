       IDENTIFICATION DIVISION.
       PROGRAM-ID. Intro-to-Java-Programming_Exercise_03_13.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variables for Scope:METHOD_MAIN_CLASS_EXERCISE_03_13_GLOBAL
       01  ARGS_MAIN_-ARRAY.
           05  args_main    PIC X(100) OCCURS 100 TIMES.
      * Variables for Scope:BLOCK_METHOD_MAIN_CLASS_EXERCISE_03_13_GLOBAL
       01  input_main      PIC X(100).
       01  status_main     PIC S9(5).
       01  income_main     PIC S9(5)V9(2).
       01  tax_main        PIC S9(5)V9(2).
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
       01 TEMP_57 PIC S9(9).
       01 TEMP_58 PIC S9(9).
       01 TEMP_59 PIC S9(9).
       01 TEMP_60 PIC S9(9).
       01 TEMP_61 PIC S9(9).
       01 TEMP_62 PIC S9(9).
       01 TEMP_63 PIC S9(9).
       01 TEMP_64 PIC S9(9).
       01 TEMP_65 PIC S9(9).
       01 TEMP_66 PIC S9(9).
       01 TEMP_67 PIC S9(9).
       01 TEMP_68 PIC S9(9).
       01 TEMP_69 PIC S9(9).
       01 TEMP_70 PIC S9(9).
       01 TEMP_71 PIC S9(9).
       01 TEMP_72 PIC S9(9).
       01 TEMP_73 PIC S9(9).
       01 TEMP_74 PIC S9(9).
       01 TEMP_75 PIC S9(9).
       01 TEMP_76 PIC S9(9).
       01 TEMP_77 PIC S9(9).
       01 TEMP_78 PIC S9(9).
       01 TEMP_79 PIC S9(9).
       01 TEMP_80 PIC S9(9).
       01 TEMP_81 PIC S9(9).
       01 TEMP_82 PIC S9(9).
       01 TEMP_83 PIC S9(9).
       01 TEMP_84 PIC S9(9).
       01 TEMP_85 PIC S9(9).
       01 TEMP_86 PIC S9(9).
       01 TEMP_87 PIC S9(9).
       01 TEMP_88 PIC S9(9).
       01 TEMP_89 PIC S9(9).
       01 TEMP_90 PIC S9(9).
       01 TEMP_91 PIC S9(9).
       01 TEMP_92 PIC S9(9).
       01 TEMP_93 PIC S9(9).
       01 TEMP_94 PIC S9(9).
       01 TEMP_95 PIC S9(9).
       01 TEMP_96 PIC S9(9).
       01 TEMP_97 PIC S9(9).
       01 TEMP_98 PIC S9(9).
       01 TEMP_99 PIC S9(9).
       01 TEMP_100 PIC S9(9).
       01 TEMP_101 PIC S9(9).
       01 TEMP_102 PIC S9(9).


       PROCEDURE DIVISION.


       ENTRY-PARA.
           PERFORM MAIN-PARA
           STOP RUN.


       MAIN-PARA.
      * Input from ODT is enabled
      * Prompt the user to enter filing status
       DISPLAY "(0-single filter, 1-married jointly or " + "qualifying widow(er), 2-married separately, 3-head of " + "houshold) Enter the filing status: " WITH NO ADVANCING
       ACCEPT status_main
      * Prompt the user to enter taxable income
       DISPLAY "Enter the taxable income: " WITH NO ADVANCING
       ACCEPT income_main
      * Compute tax
       MOVE 0 TO tax_main
       EVALUATE status_main
       WHEN 0
       COMPUTE TEMP_0 = 10 * 8350
       COMPUTE TEMP_1 = 0 * 10
       COMPUTE TEMP_2 = TEMP_0 + TEMP_1
       COMPUTE tax_main = TEMP_2
       IF income_main > 8350
       COMPUTE TEMP_3 = income_main - 8350
       COMPUTE TEMP_4 = 15 * 25600
       COMPUTE TEMP_5 = 0 * 15
       COMPUTE TEMP_6 = TEMP_4 + TEMP_5
       COMPUTE tax_main = TEMP_6
       END-IF
       IF income_main > 33950
       COMPUTE TEMP_7 = income_main - 33950
       COMPUTE TEMP_8 = 25 * 48300
       COMPUTE TEMP_9 = 0 * 25
       COMPUTE TEMP_10 = TEMP_8 + TEMP_9
       COMPUTE tax_main = TEMP_10
       END-IF
       IF income_main > 82250
       COMPUTE TEMP_11 = income_main - 82250
       COMPUTE TEMP_12 = 28 * 89300
       COMPUTE TEMP_13 = 0 * 28
       COMPUTE TEMP_14 = TEMP_12 + TEMP_13
       COMPUTE tax_main = TEMP_14
       END-IF
       IF income_main > 171550
       COMPUTE TEMP_15 = income_main - 171550
       COMPUTE TEMP_16 = 33 * 201400
       COMPUTE TEMP_17 = 0 * 33
       COMPUTE TEMP_18 = TEMP_16 + TEMP_17
       COMPUTE tax_main = TEMP_18
       END-IF
       IF income_main > 372950
       COMPUTE TEMP_19 = income_main - 372950
       COMPUTE TEMP_20 = 0 * 35
       COMPUTE TEMP_21 = TEMP_19 + TEMP_20
       COMPUTE tax_main = TEMP_21
       END-IF
       WHEN 1
       COMPUTE TEMP_22 = 10 * 16700
       COMPUTE TEMP_23 = 0 * 10
       COMPUTE TEMP_24 = TEMP_22 + TEMP_23
       COMPUTE tax_main = TEMP_24
       IF income_main > 16700
       COMPUTE TEMP_25 = income_main - 16700
       COMPUTE TEMP_26 = 67900 - 16700
       COMPUTE TEMP_27 = 15 * TEMP_26
       COMPUTE TEMP_28 = 0 * 15
       COMPUTE TEMP_29 = TEMP_27 + TEMP_28
       COMPUTE tax_main = TEMP_29
       END-IF
       IF income_main > 67900
       COMPUTE TEMP_30 = income_main - 67900
       COMPUTE TEMP_31 = 137050 - 67900
       COMPUTE TEMP_32 = 25 * TEMP_31
       COMPUTE TEMP_33 = 0 * 25
       COMPUTE TEMP_34 = TEMP_32 + TEMP_33
       COMPUTE tax_main = TEMP_34
       END-IF
       IF income_main > 137050
       COMPUTE TEMP_35 = income_main - 137050
       COMPUTE TEMP_36 = 208850 - 137050
       COMPUTE TEMP_37 = 28 * TEMP_36
       COMPUTE TEMP_38 = 0 * 28
       COMPUTE TEMP_39 = TEMP_37 + TEMP_38
       COMPUTE tax_main = TEMP_39
       END-IF
       IF income_main > 208850
       COMPUTE TEMP_40 = income_main - 208850
       COMPUTE TEMP_41 = 372950 - 208850
       COMPUTE TEMP_42 = 33 * TEMP_41
       COMPUTE TEMP_43 = 0 * 33
       COMPUTE TEMP_44 = TEMP_42 + TEMP_43
       COMPUTE tax_main = TEMP_44
       END-IF
       IF income_main > 372950
       COMPUTE TEMP_45 = income_main - 372950
       COMPUTE TEMP_46 = 0 * 35
       COMPUTE TEMP_47 = TEMP_45 + TEMP_46
       COMPUTE tax_main = TEMP_47
       END-IF
       WHEN 2
       COMPUTE TEMP_48 = 10 * 8350
       COMPUTE TEMP_49 = 0 * 10
       COMPUTE TEMP_50 = TEMP_48 + TEMP_49
       COMPUTE tax_main = TEMP_50
       IF income_main > 8350
       COMPUTE TEMP_51 = income_main - 8350
       COMPUTE TEMP_52 = 33950 - 8350
       COMPUTE TEMP_53 = 15 * TEMP_52
       COMPUTE TEMP_54 = 0 * 15
       COMPUTE TEMP_55 = TEMP_53 + TEMP_54
       COMPUTE tax_main = TEMP_55
       END-IF
       IF income_main > 33950
       COMPUTE TEMP_56 = income_main - 33950
       COMPUTE TEMP_57 = 68525 - 33950
       COMPUTE TEMP_58 = 25 * TEMP_57
       COMPUTE TEMP_59 = 0 * 25
       COMPUTE TEMP_60 = TEMP_58 + TEMP_59
       COMPUTE tax_main = TEMP_60
       END-IF
       IF income_main > 68525
       COMPUTE TEMP_61 = income_main - 68525
       COMPUTE TEMP_62 = 104425 - 68525
       COMPUTE TEMP_63 = 28 * TEMP_62
       COMPUTE TEMP_64 = 0 * 28
       COMPUTE TEMP_65 = TEMP_63 + TEMP_64
       COMPUTE tax_main = TEMP_65
       END-IF
       IF income_main > 104425
       COMPUTE TEMP_66 = income_main - 104425
       COMPUTE TEMP_67 = 186475 - 104425
       COMPUTE TEMP_68 = 33 * TEMP_67
       COMPUTE TEMP_69 = 0 * 33
       COMPUTE TEMP_70 = TEMP_68 + TEMP_69
       COMPUTE tax_main = TEMP_70
       END-IF
       IF income_main > 186475
       COMPUTE TEMP_71 = income_main - 186475
       COMPUTE TEMP_72 = 0 * 35
       COMPUTE TEMP_73 = TEMP_71 + TEMP_72
       COMPUTE tax_main = TEMP_73
       END-IF
       WHEN 3
       COMPUTE TEMP_74 = 10 * 11950
       COMPUTE TEMP_75 = 0 * 10
       COMPUTE TEMP_76 = TEMP_74 + TEMP_75
       COMPUTE tax_main = TEMP_76
       IF income_main > 11950
       COMPUTE TEMP_77 = income_main - 11950
       COMPUTE TEMP_78 = 45500 - 11950
       COMPUTE TEMP_79 = 15 * TEMP_78
       COMPUTE TEMP_80 = 0 * 15
       COMPUTE TEMP_81 = TEMP_79 + TEMP_80
       COMPUTE tax_main = TEMP_81
       END-IF
       IF income_main > 45500
       COMPUTE TEMP_82 = income_main - 45500
       COMPUTE TEMP_83 = 117450 - 45500
       COMPUTE TEMP_84 = 25 * TEMP_83
       COMPUTE TEMP_85 = 0 * 25
       COMPUTE TEMP_86 = TEMP_84 + TEMP_85
       COMPUTE tax_main = TEMP_86
       END-IF
       IF income_main > 117450
       COMPUTE TEMP_87 = income_main - 117450
       COMPUTE TEMP_88 = 190200 - 117450
       COMPUTE TEMP_89 = 28 * TEMP_88
       COMPUTE TEMP_90 = 0 * 28
       COMPUTE TEMP_91 = TEMP_89 + TEMP_90
       COMPUTE tax_main = TEMP_91
       END-IF
       IF income_main > 190200
       COMPUTE TEMP_92 = income_main - 190200
       COMPUTE TEMP_93 = 372950 - 190200
       COMPUTE TEMP_94 = 33 * TEMP_93
       COMPUTE TEMP_95 = 0 * 33
       COMPUTE TEMP_96 = TEMP_94 + TEMP_95
       COMPUTE tax_main = TEMP_96
       END-IF
       IF income_main > 372950
       COMPUTE TEMP_97 = income_main - 372950
       COMPUTE TEMP_98 = 0 * 35
       COMPUTE TEMP_99 = TEMP_97 + TEMP_98
       COMPUTE tax_main = TEMP_99
       END-IF
       WHEN OTHER
       DISPLAY "Error: invalid status"
       STOP RUN
       END-EVALUATE
      * Display the result
       DISPLAY "Tax is "
       COMPUTE TEMP_101 = tax_main * 100
       COMPUTE TEMP_102 = 100 / 0
       COMPUTE TEMP_100 = TEMP_102
       DISPLAY TEMP_100
       EXIT.


