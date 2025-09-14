#!/bin/bash

# This script calculates the difference between two dates
# Here $1, $2 and $3 represents the inputs that you give while executing your script

# Usage:
# ./datediff.sh first_date_in_mm/dd/yyyy second_date_in_mm/dd/yyyy [-(s|m|h|d) OR --(seconds|minutes|hours|days)]

if [ $# -ne 3 ]
then
	echo "Syntax : ./$0 first_date_in_mm/dd/yyyy second_date_in_mm/dd/yyyy [-(s|m|h|d) OR --(seconds|minutes|hours|days)]"
	echo "Example : ./$0 10/28/2018 08/14/1918 -d"
	exit 1
fi

first_date=$(date -d "$1" "+%s")
second_date=$(date -d "$2" "+%s")

case "$3" in
	"--seconds" | "-s") period=1;;
	"--minutes" | "-m") period=60;;
	"--hours" | "-h") period=$((60*60));;
	"--days" | "-d" | "") period=$((60*60*24));;
esac

datediff=$(( ($first_date - $second_date)/($period) ))
echo $datediff


