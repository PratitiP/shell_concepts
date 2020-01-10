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

function sort(){
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
	max=${computArr[((size-1))]}
}

#declare dictionaries for all 3 combinations
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
perH=$(bc <<< "scale=2; (${resultDict[1]}*100)/$n")
perT=$(bc <<< "scale=2; (${resultDict[0]}*100)/$n")
echo "Percentage of H = $perH%"
echo "Percentage of T = $perT%"
#find max in singlet combination
echo "Winning combination :"
if [[ $perH > $perT ]]
then
	echo "H have max percentage = $perH"
elif [[ $perH < $perT ]]
then
	echo "T have max percentage = $perT"
else
	echo "Both H and T have same percentage = $perH"
fi

echo -e "\nDoublet Combination"
c2=0
for i in ${!doubletDict[@]}
do
	computArr[$c2]=${doubletDict[$i]}
	(( c2++ ))
	case $i in
		00)echo "Percentage of TT = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		01)echo "Percentage of TH = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		10)echo "Percentage of HT = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
		11)echo "Percentage of HH = $(bc <<< "scale=2; (${doubletDict[$i]}*100)/$n")%";;
	esac
done
sort
#get key of max percentage in doubletDict
echo "Winning combination :"
for i in ${!doubletDict[@]}
do
	if [[ ${doubletDict[$i]} == $max ]]
	then
		maxper=$(bc <<< "scale=2; ($max*100)/$n")
		case $i in
			00)echo "TT have max percentage = $maxper%";;
			01)echo "TH have max percentage = $maxper%";;
			10)echo "HT have max percentage = $maxper%";;
			11)echo "HH have max percentage = $maxper%";;
		esac
	fi
done

echo -e "\nTriplet Combination"
c2=0
for i in ${!tripletDict[@]}
do
	computArr[$c2]=${tripletDict[$i]}
	(( c2++ ))
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
sort
#get key of max percentage in tripletDict
echo "Winning combination :"
for i in ${!tripletDict[@]}
do
	if [[ ${tripletDict[$i]} == $max ]]
	then
		maxper=$(bc <<< "scale=2; ($max*100)/$n")
		case $i in
			000)echo "TTT have max percentage = $maxper%";;
			001)echo "TTH have max percentage = $maxper%";;
			010)echo "THT have max percentage = $maxper%";;
			011)echo "THH have max percentage = $maxper%";;
			100)echo "HTT have max percentage = $maxper%";;
			101)echo "HTH have max percentage = $maxper%";;
			110)echo "HHT have max percentage = $maxper%";;
			111)echo "HHH have max percentage = $maxper%";;
		esac
	fi
done

