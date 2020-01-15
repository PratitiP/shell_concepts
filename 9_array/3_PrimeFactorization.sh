#!/bin/bash -x
function get_Prime_Factors(){
	n=$1
	a=0
	for (( ; $(($n%2)) == 0 ; ))
	do
		if [[ $(($n%2)) == 0 ]];
		then 
			echo 2
			arr[a]=2
			(( a++ ))
			n=$(($n/2))
		fi
	done

	for (( i=3 ; $(($i*$i)) <= $n ; i=$(($i+2)) ))
	do
		for (( ; $(($n%$i)) == 0 ; ))
		do
			echo $i
			arr[a]=$i
			(( a++ ))
			n=$(($n/$i))
		done
	done

	if [[ n > 2 ]];
	then 
		echo $n
		arr[a]=$n
		(( a++ ))
	fi
}

echo Enter a no to get prime factors : 
read n
get_Prime_Factors $n
echo "Prime factors array : [ ${arr[@]} ]"
