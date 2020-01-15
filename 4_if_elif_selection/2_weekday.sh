#!/bin/bash -x

echo "Enter no for weekdays (0-6)"
read n

if [[ $n == 0 ]];
then echo Sunday
elif [[ $n == 1 ]];
then echo Monday
elif [[ $n == 2 ]];
then echo Tuesday
elif [[ $n == 3 ]];
then echo Wednesday
elif [[ $n == 4 ]];
then echo Thursday
elif [[ $n == 5 ]];
then echo Friday
elif [[ $n == 6 ]];
then echo Saturday
else
echo Not valid weekday
fi
