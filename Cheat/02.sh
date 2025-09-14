#!/bin/bash

# This script Extracts the Day, Month, Date, Time, Timezone and Year from the Date and Displays the same

# The awk command below cuts/prints a particular field/column based on the delimiter supplied using the -F option to it

day=`date | awk -F' ' '{print $1}'`    # backticks here indicate the output of the entire commands. It is not single quotes !

echo $day

month=`date | awk -F' ' '{print $2}'`

echo $month

dt=`date | awk -F' ' '{print $3}'`

echo $dt

dt=`date | awk -F' ' '{print $3}' | sed 's/^0//'`    # Output passed to sed command to substitute leading zeroes with nothing

echo $dt

tm=`date | awk -F' ' '{print $4}'`

echo $tm

timezone=`date | awk -F' ' '{print $5}'`

echo $timezone

year=`date | awk -F' ' '{print $6}'`

echo $year


