#!/bin/bash -x

function sortAscending(){
	size=${#computArr[@]}
	for (( i=0 ; i<size ; i++ ))
	do
		for(( j=$(($i+1)) ; j<size ; j++ ))
		do
			if [[ ${computArr[$i]} -gt ${computArr[$j]} ]]
			then
				temp=${computArr[$i]}
				computArr[i]=${computArr[$j]}
				computArr[j]=$temp
			fi
		done
	done
	echo "Array sorted in Ascending order : ${computArr[@]}"
}

function sortDescending(){
	size=${#computArr[@]}
	for (( i=0 ; i<size ; i++ ))
	do
		for(( j=$(($i+1)) ; j<size ; j++ ))
		do
			if [[ ${computArr[$i]} -lt ${computArr[$j]} ]]
			then
				temp=${computArr[$i]}
				computArr[i]=${computArr[$j]}
				computArr[j]=$temp
			fi
		done
	done
	echo "Array sorted in descending order : ${computArr[@]}"
}


read -p "Enter 3 numbers : " a b c
echo $a $b $c
#Store computations into dict
declare -A comput
comput['a+b*c']=$(( a + b * c ))
comput['a*b+c']=$(( a * b + c ))
comput['c+a/b']=$(( c + a / b ))
comput['a%b+c']=$(( a%b+c))

echo "Computations stored in dictionary"
#simulteneously store values into array
c=0
for i in ${!comput[@]}
do
	echo "[$i] : ${comput[$i]}"
	computArr[$c]=${comput[$i]}
	(( c++ ))
done

#show stored values in array
echo "Array of computations = [ ${computArr[@]} ]"
sortDescending
sortAscending

