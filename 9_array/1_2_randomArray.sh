##!/bin/bash -x
function gen_random(){
	diff=$((999-100+1))
	max=100
	smax=100
	min=999
	smin=999
	for (( i=0 ; i<10 ; i++ ))
	do
		r=$(($(($RANDOM%diff))+100))
		arr[i]=$r
		#get second max
		if [[ r -gt smax ]]
		then
			#if next no is lt max but gt smax then change only smax
			if [[ r -lt max ]]
			then smax=$r
			else
				smax=$max
				max=$r
			fi
		fi
		#get second min
		if [[ r -lt smin ]]
		then
			#if next no r is gt min but lt smin then change only smin
			if [[ r -gt min ]]
			then smin=$r
			else
				smin=$min
				min=$r
			fi
		fi
	done
	echo ${arr[@]}
	echo -e "second largest no = $smax\nsecond smallest no = $smin"
}

function sort(){
	size=${#arr[@]}
	for (( i=0 ; i<size ; i++ ))
	do
		for(( j=$(($i+1)) ; j<size ; j++ ))
		do
			if [[ ${arr[$i]} -gt ${arr[$j]} ]]
			then
				temp=${arr[i]}
				arr[i]=${arr[j]}
				arr[j]=$temp
			fi
		done
	done
	echo "Sorted array : ${arr[@]}"
	echo -e "From sorted array\nsecond largest = ${arr[$(($size-2))]} \nsecond smallest = ${arr[1]} "
}

gen_random
sort
