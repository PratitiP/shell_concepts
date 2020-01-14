#!/bin/bash -x
echo Think a no between 1 to 100

f=0
ncR=100
ncL=0
while [[ $ncL -lt $ncR ]]
do

	#newFactor is to be added or subtracted to get new nc depending on l/g value
	newFactor=$(( (ncR+ncL) / 2 ))
	echo "is no greater than $newFactor (y/n) : "
	read lg
	#logic to get new n/2 child
	if [[ $lg == 'n' ]]
	then 
		ncR=$newFactor 
	elif [[ $lg == 'y' ]]
	then
		ncL=$newFactor 
	fi
	if [[ $((ncR-ncL)) -eq 1 ]]
	then 
		break
	fi

done
echo "Your number is : $ncR"
