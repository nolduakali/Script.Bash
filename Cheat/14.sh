#!/bin/bash 

# This script calculates salary related information

# below function carries out arithmetic calculations on the input supplied i.e. $@ and prints the result in two decimals

function calc() { awk "BEGIN {printf \"%.2f\n\", $@}"; }

function calcii() { awk "BEGIN {printf \"%.0f\n\", $@}"; }

function Salary-Data {                          # you can use functions to group pieces of code in a more logical way

	echo "
	Employee Name	Gross Pay	Deduc 1	Deduc 2
	Suix Chin	3,781.17	234.43	54.83
	Isaac Viet	3,784.32	234.63	54.87
	Dennis Ho	8,565.51	531.06	124.2
	Bill Jelen	9,069.66	562.32	131.51
	"

}

TotalGross=0
RecordCount=0
AverageGross=0

# Following line executes the function, skips I st, II nd and Last Lines, Substitutes Commas with Nothing and
# reads line by line in a while loop storing data in variables at the same time
# Here IFS defines the field seperator as \t which is a tab character
# Depending on your data you can change the field seperator

# For below line, instead of the Salary-Data function, you can use cat filename to read the data from a file

Salary-Data | sed '1d;2d;$d' | sed 's/,//' | ( while IFS=$'\t' read -r Name Gross Deduc1 Deduc2
do 

	TotalDeduc=`calc $Deduc1+$Deduc2`
	NetPay=`calc $Gross-$TotalDeduc`
	AnnualIncome=`calc $NetPay*12`
	WeeklyPay=`calc $AnnualIncome/52`    # Here division is rounded up to two digits using scale
	TotalGross=`calc $TotalGross+$Gross`
	RecordCount=`calcii $RecordCount+1`

	echo "---------------------------------------------------------"

	printf " Name=$Name \n Gross=$Gross \n Deduc1=$Deduc1 \n Deduc2=$Deduc2 \n TotalDeduc=$TotalDeduc \n NetPay=$NetPay \n AnnualIncome=$AnnualIncome \n WeeklyPay=$WeeklyPay \n"

done

echo "---------------------------------------------------------"

if [ $RecordCount -gt 0 ]; then
	AverageGross=`calc $TotalGross/$RecordCount`
fi

printf " TotalGross=$TotalGross \n RecordCount=$RecordCount \n AverageGross=$AverageGross \n"

echo "---------------------------------------------------------" )


