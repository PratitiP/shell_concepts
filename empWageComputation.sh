##!/bin/bash -x

#constants for wage calculation
WAGE_PER_HR=20
FULL_DAY=1
PART_TIME=2

echo Welcome to Employee Wage Computation Program

#check attendance & add empHrs accordingly
randAttend=$((RANDOM%3));
#modified for switch case
case $randAttend in
	$FULL_DAY)
		echo "Employee is Present"
		empHrs=8
		;;
	$PART_TIME)
		echo "Employee is Part Time"
		empHrs=4
		;;
	*)
		echo "Employee is absent"
		empHrs=0
		;;
esac

#calculate daliy wage
dailyWage=$(( WAGE_PER_HR * empHrs))
echo "Daily wage = $dailyWage"


