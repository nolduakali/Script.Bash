#!/bin/bash

# This script is a shell data entry system for a standalone kiosk
# stores user inputs in userinputs.txt file in the current folder

# trap "" 2 3 9 15    # To Trap / Prevent signals like Ctrl+C, uncomment this line i.e. Remove the # at the beginning of the line

#function to paint fields onto the screen

function scrnpaint()

{

	tput clear

	echo ""

	echo ""

	echo "                          INWARDS GOODS ENTRY"

	echo "                          -------------------"

	# echo ""

	echo ""

	echo "                          Entry Date   : $EDATE"

	echo "                          Docket Number: $DOCNUM"

	echo "                          Supplier Code: $SUPPCODE"

	echo "                          Carrier      : $CARRIER"

	echo "                          Goods Code   : $GOODSCODE"

	echo "                          Goods Name   : $GOODSNAME"

	echo "                          Quantity     : $GQUANT"

	echo "                          Measure      : $GMEAS"

	echo "                          Received by  : $RECDBY"

	echo ""

}

#function to post entry data

function dopost()

{

	echo "$EDATE#$DOCNUM#$SUPPCODE#$CARRIER#$GOODSCODE#$GOODSNAME#$GQUANT#$GMEAS#$RECDBY" >> userinputs.txt

}

#Main program

#colour the screen

tput setb 6

tput clear

#Initialise variables

EDATE=`date +%d/%m/%Y`

DOCNUM=""

SUPPCODE=""

CARRIER=""

GOODSCODE=""

GOODSNAME=""

GQUANT=""

GMEAS=""

RECDBY=""

#Loop round each entry until filled, moving cursor to correct entry point, and

#repainting the screen to show filled in variables

while [ ${#DOCNUM} -lt 1 ]

do

	scrnpaint

	tput cup 6 41

	read DOCNUM

done

while [ ${#SUPPCODE} -lt 1 ]

do

	scrnpaint

	tput cup 7 41

	read SUPPCODE

done

while [ ${#CARRIER} -lt 1 ]

do

	scrnpaint

	tput cup 8 41

	read CARRIER

done

while [ ${#GOODSCODE} -lt 1 ]

do

	scrnpaint

	tput cup 9 41

	read GOODSCODE

done

while [ ${#GOODSNAME} -lt 1 ]

do

	scrnpaint

	tput cup 10 41

	read GOODSNAME

done

while [ ${#GQUANT} -lt 1 ]

do

	scrnpaint

	tput cup 11 41

	read GQUANT

done

while [ ${#GMEAS} -lt 1 ]

do

	scrnpaint

	tput cup 12 41

	read GMEAS

done

while [ ${#RECDBY} -lt 1 ]

do

	scrnpaint

	tput cup 13 41

	read RECDBY

done

scrnpaint

#Request post OK

tput cup 15 25

echo " OK to Post Entry (Y or N):"

tput cup 15 52

read OKPOST

POSTOK=`echo $OKPOST | tr a-z A-Z`

if [ "$POSTOK" = "Y" ]

then

	dopost

	if [ $? -eq 0 ]; then

		tput cup 17 0

		echo " Your Entry Has Been Successfully Posted. Press Enter to Clear the Screen OR Else Press Ctrl+C to Quit...."

		read input

		bash ./$0

	else

		tput cup 17 0

		echo " Error Occured While Posting! Please inform the concerned authorities. Press Enter to Clear the Screen OR Else Press Ctrl+C to Quit...."

		read input

		bash ./$0

	fi

else

	tput cup 17 0

	echo " Press Enter to Clear the Screen and Retype Your Inputs OR Else Press Ctrl+C to Quit...."

	read input

	bash ./$0

fi



