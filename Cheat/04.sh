#!/bin/bash

# This script calculates the Age of a Person after Reading his Date of Birth

# below function carries out arithmetic calculations on the input supplied i.e. $@ and prints the result

function calc() { awk "BEGIN {printf \"%.0f\n\", $@}"; }

echo -n "Type the birthdate (mm-dd-yyyy format) and Press Enter Key: "
read birthdate

birthmonth=`echo $birthdate | awk -F'-' '{print $1}'`
birthday=`echo $birthdate | awk -F'-' '{print $2}'`
birthyear=`echo $birthdate | awk -F'-' '{print $3}'`

currentdate=`date +%m-%d-%Y`

currentmonth=`echo $currentdate | awk -F'-' '{print $1}'`
currentday=`echo $currentdate | awk -F'-' '{print $2}'`
currentyear=`echo $currentdate | awk -F'-' '{print $3}'`

if [ "$currentmonth" -lt "$birthmonth" ] || ([ "$currentmonth" -eq "$birthmonth" ] && [ "$currentday" -lt "$birthday" ]); then
	age=`calc $currentyear-$birthyear-1`
else
	age=`calc $currentyear-$birthyear`
fi

echo "Age =" $age


