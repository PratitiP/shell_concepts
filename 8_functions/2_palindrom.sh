#!/bin/bash -x

function get_palindrom(){
	n=$1
	rev=`echo $n | rev`
	echo $rev
	if [[ n -eq rev ]]
	then echo "$n is palindrom"
	else echo "$n is not palindrom"
	fi
}

echo Enter a no to check Palindrom
read n
get_palindrom $n 
