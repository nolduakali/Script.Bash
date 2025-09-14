#!/bin/bash

# This script continously adds two numbers given using a while loop

while true
do
	read -p "Type two numbers with space in between ( -1 to quit ) : " a b

	if [ $a -eq -1 ]
	then
		break
	fi

	ans=$(( a + b ))
	echo "$a + $b =" $ans

done


