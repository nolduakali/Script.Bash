#!/bin/bash

# This script displays an exercise routine, depending on the day

day=`date | awk -F' ' '{print $1}'`    

echo

echo "Today is:" $day "day"

echo

if [ "$day" == "Mon" ]; then

	echo "Exercises for Today:" Barbell squats, Leg press, Leg curls, Lunges, Leg extensions, Seated calf raise, Standing calf raise, Cardio

elif [ "$day" == "Tue" ]; then

	echo "Exercises for Today:" Barbell bench press, Incline dumbbell press, Flat dumbbell flies, Dumbbell pullovers, Push ups, Leg raises off bench, Cable crunches, Incline sit ups, Cardio

elif [ "$day" == "Wed" ]; then

	echo "Exercises for Today:" Chin up, One arm dumbbel rows, Reverse grip pulldowns, Barbell power cleans, Hyperextensions, Dumbbell side bends, Cardio

elif [ "$day" == "Thu" ]; then

	echo "Exercises for Today:" Military press, Side laterals, Barbell upright rows, Bent Over Laterals, Incline sit ups, Cardio

elif [ "$day" == "Fri" ]; then

	echo "Exercises for Today:" Close grip bench press, Standing barbell curls, Skull crushers, Incline dumbbell curls, Triceps cable press downs, Dumbbell concentration curls, Seated calf raise, Standing calf raise, Cardio

elif [ "$day" == "Sat" ]; then

	echo "No Exercises for Today"

else

	echo "No Exercises for Today"

fi

echo


