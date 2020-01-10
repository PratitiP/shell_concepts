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
	doubletDict[$r1$r2]=$(( ${doubletDict[$r1$r2]} +1))
}


function getTripletFlipResult(){
	r1=$((RANDOM%2))
	r2=$((RANDOM%2))
	r3=$((RANDOM%2))
	tripletDict[$r1$r2$r3]=$(( ${tripletDict[$r1$r2$r3]} +1))
}

declare -A resultDict
resultDict=([0]=0 [1]=0)

declare -A doubletDict
doubletDict=([00]=0 [01]=0 [10]=0 [11]=0)

declare -A tripletDict
tripletDict=([000]=0 [001]=0 [010]=0 [011]=0 [100]=0 [101]=0 [110]=0 [111]=0)


read -p "How many times you want to flip coin/s : " n
for (( i=0 ; i<n ; i++))
do
	getSingletFlipResult
	getDoubletFlipResult
	getTripletFlipResult
done

echo -e "\nSinglet Combination"
echo "Percentage of H = $(bc <<< "scale=2; (${resultDict[1]}*100)/$n")%"
echo "Percentage of T = $(bc <<< "scale=2; (${resultDict[0]}*100)/$n")%"

echo -e "\nDoublet Combination"
for i in ${!doubletDict[@]}
do
	case $i in
		00)echo "Percentage of TT = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		01)echo "Percentage of TH = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		10)echo "Percentage of HT = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		11)echo "Percentage of HH = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
	esac
done

echo -e "\nTriplet Combination"
for i in ${!tripletDict[@]}
do
	case $i in
		000)echo "Percentage of TTT = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		001)echo "Percentage of TTH = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		010)echo "Percentage of THT = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		011)echo "Percentage of THH = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		100)echo "Percentage of HTT = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		101)echo "Percentage of HTH = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		110)echo "Percentage of HHT = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
		111)echo "Percentage of HHH = $(bc <<< "scale=2; (${tripletDict[$i]}*100)/$n")%";;
	esac
done


