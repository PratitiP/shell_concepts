#!/bin/bash -x

echo Enter a no. 
read n
isPrime=0

for (( i=2 ; i <= `expr $n / 2` ; i++ ))
do 
	echo `expr $n % $i`
	if [[ `expr $n % $i` == 0 ]];
	then 
		isPrime=1
		break
	fi
done

if [[ $isPrime == 1  ]];
then echo Number is not Prime
else
	echo Number is Prime
fi
