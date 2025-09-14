#!/bin/bash

# This script generates numbers divisible by 5

for ((number=1;number < 100;number++))
	{
		if (( $number % 5 == 0 ))
		then
			echo "$number is divisible by 5 "
		fi
	}


