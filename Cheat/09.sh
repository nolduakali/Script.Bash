#!/bin/bash

# This script is another version of the previous script, using the case statement instead of the if elif else statement

day=`date | awk -F' ' '{print $1}'`    

echo

echo "Today is:" $day "day"

echo

case $day in

	Mon) echo "Exercises for Today:" Barbell squats, Leg press, Leg curls, Lunges, Leg extensions, Seated calf raise, Standing calf raise, Cardio ;;

	Tue) echo "Exercises for Today:" Barbell bench press, Incline dumbbell press, Flat dumbbell flies, Dumbbell pullovers, Push ups, Leg raises off bench, Cable crunches, Incline sit ups, Cardio ;;

	Wed) echo "Exercises for Today:" Chin up, One arm dumbbel rows, Reverse grip pulldowns, Barbell power cleans, Hyperextensions, Dumbbell side bends, Cardio ;;

	Thu) echo "Exercises for Today:" Military press, Side laterals, Barbell upright rows, Bent Over Laterals, Incline sit ups, Cardio ;;

	Fri) echo "Exercises for Today:" Close grip bench press, Standing barbell curls, Skull crushers, Incline dumbbell curls, Triceps cable press downs, Dumbbell concentration curls, Seated calf raise, Standing calf raise, Cardio ;;

	Sat) echo "No Exercises for Today" ;;

	Sun) echo "No Exercises for Today" ;;

esac

echo


