#!/bin/bash -x

#constants for wage calculation
WAGE_PER_HR=20
FULL_DAY=1
PART_TIME=2
MONTH_WORKING_DAYS=20

#variables for wage calculations
monthlyWage=0
dailyWage=0
totalWorkingHrs=0

function getWorkHrs(){
	case $1 in
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
	echo $empHrs
}

echo Welcome to Employee Wage Computation Program

#check attendance & add empHrs accordingly
#calculate for a month
for (( day=1 ; day<=$MONTH_WORKING_DAYS ; day++ ))
do
	empWorkHrs=$( getWorkHrs $((RANDOM%3)) )
	totalWorkingHrs=$(( totalWorkingHrs + empWorkHrs ))
	if [[ $totalWorkingHrs -ge 100 ]]
	then 
		totalWorkingHrs=100
		echo Total Working Hrs Reached
		break
	fi
done

if [[ $day > 20 ]]
then
	echo Total Working days Reached
fi
monthlyWage=$(( totalWorkingHrs * WAGE_PER_HR ))
echo "Monthly Salary = $monthlyWage"


