#!/bin/bash -x

#constants for wage calculation
WAGE_PER_HR=20
FULL_DAY_HRS=8

echo Welcome to Employee Wage Computation Program

#check attendance using Random no
randAttend=$((RANDOM%2));
if [[ $randAttend == 1 ]]
then
	echo "Employee is Present"
else
	echo "Employee is absent";
fi

#calculate daliy wage
dailyWage=$(( WAGE_PER_HR * FULL_DAY_HRS * randAttend))
echo "Daily wage = $dailyWage"


