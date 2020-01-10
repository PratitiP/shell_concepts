#!/bin/bash -x
echo Welcome to Employee Wage Computation Program

randAttendance=$((RANDOM%2));
if [[ randAttendance == 1 ]]
then
	echo "Employee is Present"
else
	echo "Employee is absent";
fi
