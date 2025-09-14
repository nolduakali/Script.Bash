#!/bin/bash

# This script executes the date command and displays date in various formats

date

date +%m-%d-%Y               # You can change the order of m, d and Y as per your requirements

date +"%m-%d-%Y"               # Another way to get the same output

date +%H-%M-%S	             # display time in HH:MM:SS format

date +"%H-%M-%S"             # Another way to get the same output

TODAY=$(date +%m-%d-%Y)      # Store date in a variable

echo "Today's Date is" $TODAY    # Display the contents of a variable

TODAY=`date +%m-%d-%Y`       # Another way to Store date in a variable. Here backticks are used

echo "Today's Date is" $TODAY    # Display the contents of a variable

date --date="next monday"    # gets date of next Monday

date --date="last monday"    # gets date of last Monday

date --date="+1 day"         # gets 1 day after date i.e. tomorrow's date

date --date="-1 day"         # gets 1 day before date i.e. yesterday's date

date --date="+1 month"       

date --date="-1 month"       

date +%m-%d-%Y --date="+1 day" # Combining the above usages

date --date "next month - $(date +%d) day"    # to print last day of current month on GNU/BASH shell

date +"%b" | tr 'a-z' 'A-Z'  # To print month in uppercase. Here pipe character sends the output to the tr command


