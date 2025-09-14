#!/bin/bash

# This script uses a For Loop to generate dates in a particular sequence

for i in 7 14 21 28
do
	date +%m-%d-%Y --date="+$i day"    # Here variable i is substituted by for loop
done


