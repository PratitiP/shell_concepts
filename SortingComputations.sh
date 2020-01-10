#!/bin/bash -x

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


