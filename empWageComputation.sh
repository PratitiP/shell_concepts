##!/bin/bash -x

#constants for wage calculation
WAGE_PER_HR=20
FULL_DAY=1
PART_TIME=2

echo Welcome to Employee Wage Computation Program

#check attendance & add empHrs accordingly
randAttend=$((RANDOM%3));
if [[ $randAttend == $FULL_DAY ]]
then
	echo "Employee is Present"
	empHrs=8
elif [[ $randAttend == $PART_TIME ]]
then
	echo "Employee is Part Time"
	empHrs=4
else
	echo "Employee is absent"
	empHrs=0
fi

#calculate daliy wage
dailyWage=$(( WAGE_PER_HR * empHrs))
echo "Daily wage = $dailyWage"


