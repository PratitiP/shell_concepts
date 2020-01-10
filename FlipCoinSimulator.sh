#!/bin/bash -x

function getSingletFlipResult(){
	r=$((RANDOM%2))
	if (( r==1))
	then 
		resultDict[$r]=$(( ${resultDict[$r]} + 1 ))
	else
		resultDict[$r]=$(( ${resultDict[$r]} + 1 ))
	fi
}

function getDoubletFlipResult(){
	r1=$((RANDOM%2))
	r2=$((RANDOM%2))
	echo $r1$r2
	doubletDict[$r1$r2]=$(( ${doubletDict[$r1$r2]} +1))
}

declare -A doubletDict
doubletDict=([00]=0 [01]=0 [10]=0 [11]=0)

declare -A resultDict
resultDict=([0]=0 [1]=0)
read -p "How many times you want to flip a single coin : " n
for (( i=0 ; i<n ; i++))
do
	getSingletFlipResult
	getDoubletFlipResult
done

echo ${!doubletDict[@]}
echo ${doubletDict[@]}
#echo "Percentage of H = $(bc <<< "scale=2; (${resultDict[1]}*100)/$n")%"
#echo "Percentage of T = $(bc <<< "scale=2; (${resultDict[0]}*100)/$n")%"

declare -A doublet
for i in ${!doubletDict[@]}
do
	case $i in
		00)doublet['TT']=$(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n");;
		01)doublet['TH']=$(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n");;
		10)doublet['HT']=$(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n");;
		11)doublet['HH']=$(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n");;
	esac
done
echo ${!doublet[@]}
echo ${doublet[@]}


