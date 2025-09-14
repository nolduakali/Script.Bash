#!/bin/bash

# This script calculates days lived

# below function carries out arithmetic calculations on the input supplied i.e. $@ and prints the result in two decimals

function calc() { awk "BEGIN {printf \"%.2f\n\", $@}"; }

read -p "Please type your age and press enter key: " age
days=`calc $age*365`
echo "That makes you over $days days old! "


