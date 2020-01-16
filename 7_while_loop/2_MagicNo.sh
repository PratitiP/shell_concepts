#!/bin/bash -x
echo Think a no between 1 to 100

head=0
tail=100
while [[ $head < $tail ]]
do
	if [[ $((tail-head)) == 1 ]]
	then break
	fi
	newFactor=$(( (head+tail) / 2 ))
	echo "is no greater than $newFactor (y/n) : "
	read lg
	#newFactor is to be added or subtracted to get new nc depending on l/g value
	echo "newFactor=$newFactor"
	#logic to get new n/2 (nc)
	if [[ $lg == 'n' ]]
	then 
		tail=$newFactor
	elif [[ $lg == 'y' ]]
	then
		head=$newFactor
	fi

done
echo "Your no is $tail"
