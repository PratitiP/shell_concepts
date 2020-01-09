
echo Think a no between 1 to 100

f=0
np=100
nc=50
while [[ $f == 0 ]]
do
	echo "is no greater than $nc (y/n) : "
	read lg
	temp=$nc
	#newFactor is to be added or subtracted to get new nc depending on l/g value
	newFactor=$(( (nc-np) / 2 ))
	if [[ $newFactor -lt 0 ]]
	then 
		newFactor=$(( newFactor*(-1) ))
	fi
	#logic to get new n/2 (nc)
	if [[ $lg == 'n' ]]
	then 
		nc=$(( nc - newFactor )) 
		np=$temp
	elif [[ $lg == 'y' ]]
	then
		nc=$(( nc + newFactor )) 
		np=$temp
	fi

	echo "nc = $nc and np = $np"
	if [[ ($nc -eq $np) || ($newFactor -eq 0) ]]
	then 
		if [[ $lg == 'y' ]]
		then (( np++ ))
		fi
		echo "Your no is $np"
		f=1
	fi
done

