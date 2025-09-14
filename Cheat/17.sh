#!/bin/bash

# This script displays and collects applicant information using a graphical form

FILE="Applicants.txt"

function form() {

	zenity --forms --title="Applicant Information" --text="Please Input Your Details" \
		--add-entry="First Name" \
		--add-entry="Last Name" \
		--add-calendar="Date of Birth" --forms-date-format="%d/%m/%Y" \
		--add-list "Gender" --list-values 'Male|Female' 2>/dev/null >> $FILE

}

function query() {

	zenity --question --title "Confirmation" --text='Your Record has been successfully added. Would you like to add more ?' 2>/dev/null

}

if [ "`builtin type -p zenity`" ]; then

	form

	case $? in

		0)

			query

			while [ $? -eq 0 ]
			do

				form

				if [ $? -eq 0 ]; then
					query

					if [ $? -eq 0 ]; then
						continue
					else
						break
					fi

				else
					break
				fi

			done

			;;

		1)
			exit
			;;

		-1)
			echo "An unexpected error has occurred."
			exit
			;;
	esac

else
	echo "This script needs zenity program. It is not installed on this system. Hence exiting...."
fi


