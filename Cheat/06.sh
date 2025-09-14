#!/bin/bash

# This script calculates the days between two dates using sqlite3 and python program, thus leveraging its functions.
# You can use their other functions similarly. Check google.

if [ "`builtin type -p python`" ]; then

days=`python -c "from datetime import date as d; print(d.today() - d(2014, 12, 18))"`
echo $days

else
	echo
	echo "This script needs python program. It is not installed on this system."
	echo
fi


if [ "`builtin type -p sqlite3`" ]; then

days=`sqlite3 <<< "select julianday('now')-julianday('2014-12-18');"`
echo $days

part_of_string=`sqlite3 <<< "select substr('john pink',1,instr('john pink',' ')-1);"`
echo $part_of_string

# Compute the date of the first Tuesday in October for the current year.

First_Tuesday=`sqlite3 <<< "SELECT date('now','start of year','+9 months','weekday 2');"`
echo $First_Tuesday

else
	echo
	echo "This script needs sqlite3 program. It is not installed on this system."
	echo
fi


