#!/bin/bash -x

function check_sum_zero(){
	size=${#arr[@]}
	for (( i=0 ; i<$(($size-2)) ; i++ ))
	do
		for(( j=$(($i+1)) ; j<$(($size-1)) ; j++ ))
		do
			for (( k=$(($i+2)) ; k<$(($size-2)) ; k++))
			do
				if [[ $(( ${arr[$i]} + ${arr[$j]} + ${arr[$k]} )) -eq 0 ]]
				then
					echo " ${arr[$i]} + ${arr[$j]} + ${arr[$k]} = 0"
				fi
			done
		done
	done
}

echo "Enter n to creat array with n numbers : "
read n
echo "Enter $n values (+ve & -ve) : "
for (( i=0 ; i < $n ; i++ ))
do
	read ip
	arr[i]=$ip
done
echo ${arr[@]}

check_sum_zero ${arr[@]}
