#!/bin/bash

# This script displays and executes frequently used commands menu using select and case commands

echo
echo "Commands Menu"
echo "-------------"
echo

PS3='Please enter your choice: '
options=("Host Name" "Uptime" "Disk Free" "Quit")

select opt in "${options[@]}"
do
	case $opt in
		"Host Name")
			hostname
			;;
		"Uptime")
			uptime
			;;
		"Disk Free")
			df -h
			;;
		"Quit")
			break
			;;
		*) echo Invalid Option;;
	esac
done


