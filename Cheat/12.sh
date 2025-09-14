#!/bin/bash

# This script gives the multiplication table for any given number

# below function carries out arithmetic calculations on the input supplied i.e. $@ and prints the result

function calc() { awk "BEGIN {printf \"%.0f\n\", $@}"; }

if [ $# -ne 1 ]
then
	echo "Syntax : ./$0 number" 
	echo "Example: ./$0 18 will give you the 18th table"
	exit 1
fi

n=$1

for i in 1 2 3 4 5 6 7 8 9 10 11 12
do
	echo "$n * $i = `calc $i*$n`"
done


