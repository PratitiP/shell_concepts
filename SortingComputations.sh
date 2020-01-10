#!/bin/bash -x

read -p "Enter 3 numbers : " a b c
echo $a $b $c
declare -A comput
comput['a+b*c']=$(( a + b * c ))
comput['a*b+c']=$(( a * b + c ))
comput['c+a/b']=$(( c + a / b ))
comput['a%b+c']=$(( a%b+c))

for i in ${!comput[@]}
do
	echo "$i -> ${comput[$i]}"
done
