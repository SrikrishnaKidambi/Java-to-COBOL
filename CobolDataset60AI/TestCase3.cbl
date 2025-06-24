       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTCASE3.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ANGLE-DEGREES    PIC 9(3) VALUE 45.
       01 ANGLE-RADIANS    USAGE FLOAT-LONG.
       01 SIN45            USAGE FLOAT-LONG.
       01 TAN45            USAGE FLOAT-LONG.
       01 PI               USAGE FLOAT-LONG VALUE 3.14159265358979.

       PROCEDURE DIVISION.
           EVALUATE ANGLE-DEGREES
               WHEN 45
                   COMPUTE ANGLE-RADIANS = ANGLE-DEGREES * (PI / 180.0)

                   CALL "sin" USING BY VALUE ANGLE-RADIANS
                               RETURNING SIN45

                   CALL "tan" USING BY VALUE ANGLE-RADIANS
                               RETURNING TAN45

                   DISPLAY "sin(45°): " SIN45
                   DISPLAY "tan(45°): " TAN45
               WHEN OTHER
                   DISPLAY "Angle not handled"
           END-EVALUATE

           STOP RUN.
