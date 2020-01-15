#!/bin/bash -x

echo "Enter a two no to get prime nos. in that range" 
read a b

echo "Prime nos. in the range ( $a - $b ) : "

for (( n=a ; n <= b ; n++  ))
do
	isPrime=0
	for (( i=2 ; i <= `expr $n / 2` ; i++ ))
	do 
		if [[ `expr $n % $i` == 0 ]];
		then 
			isPrime=1
			break
		fi
	done
	if [[ $isPrime == 0 ]];
	then echo "$n"
	fi
done

