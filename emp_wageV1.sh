#!/bin/bash -x

isFullTime=1;
isPartTime=2;
empRate_per_hr=20;

randomCheck=$((RANDOM%2));
if [ $isFullTime == $randomCheck ]
	then 
		echo "Employee is Present";
		empHrs=8;
elif [ $isPartTime == $randomCheck ]
	then
		echo "Employee is Part-Time";
		empHrs=4;
else
	echo "Employee is absent";
	empHrs=0;
fi
salary=$(($empRate_per_hr*$empHrs));
echo "Salary : $salary"

