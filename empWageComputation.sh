#!/bin/bash -x

#constants for wage calculation
WAGE_PER_HR=20
FULL_DAY=1
PART_TIME=2
MONTH_WORKING_DAYS=20

#variables for wage calculations
monthlyWage=0
dailyWage=0

echo Welcome to Employee Wage Computation Program

#check attendance & add empHrs accordingly
#calculate for a month
for (( day=1 ; day<=$MONTH_WORKING_DAYS ; day++ ))
do
	randAttend=$((RANDOM%3));
	case $randAttend in
		$FULL_DAY)
			empHrs=8
			;;
		$PART_TIME)
			empHrs=4
			;;
		*)
			empHrs=0
			;;
	esac
	#calculate monthly wage
	dailyWage=$(( WAGE_PER_HR * empHrs))
	monthlyWage=$(( monthlyWage + dailyWage))
done

echo "Monthly Salary = $monthlyWage"


