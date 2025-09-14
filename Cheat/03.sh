#!/bin/bash

# This script Extracts the Hour, Minute and Second from the Date and Displays the same

hour=`date | awk -F' ' '{print $4}' | awk -F':' '{print $1}'`

echo "Hour =" $hour

minute=`date | awk -F' ' '{print $4}' | awk -F':' '{print $2}'`

echo "Minute =" $minute

second=`date | awk -F' ' '{print $4}' | awk -F':' '{print $3}'`

echo "Second =" $second


