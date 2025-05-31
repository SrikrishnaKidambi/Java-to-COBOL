       PROCEDURE DIVISION.

      * Input from ODT is enabled
      * Take input from user
       DISPLAY "Enter a number (1-7) for the day of the week: " WITH NO ADVANCING.
       ACCEPT day.
      * Determine day using switch-case
       EVALUATE day
       WHEN 1
       DISPLAY "Sunday"
       WHEN 2
       DISPLAY "Monday"
       WHEN 3
       DISPLAY "Tuesday"
       WHEN 4
       DISPLAY "Wednesday"
       WHEN 5
       DISPLAY "Thursday"
       WHEN 6
       DISPLAY "Friday"
       WHEN 7
       DISPLAY "Saturday"
       WHEN OTHER
       DISPLAY "Invalid input! Please enter a number between 1 and 7."
       END-EVALUATE.
       STOP RUN.

