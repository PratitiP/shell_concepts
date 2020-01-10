#!/bin/bash -x

function getFlipResult(){
	r=$((RANDOM%2))
	if (( r==1))
	then 
		resultDict[$r]=$(( ${resultDict[$r]} + 1 ))
	else
		resultDict[$r]=$(( ${resultDict[$r]} + 1 ))
	fi
}

declare -A resultDict
resultDict=([0]=0 [1]=0)
read -p "How many times you want to flip a single coin : " n
for (( i=0 ; i<n ; i++))
do
	getFlipResult
done

echo "Percentage of H = $(bc <<< "scale=2; (${resultDict[1]}*100)/$n")%"
echo "Percentage of T = $(bc <<< "scale=2; (${resultDict[0]}*100)/$n")%"


