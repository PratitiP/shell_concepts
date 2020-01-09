function roll_dice(){
	r=$(($(($RANDOM%6))+1))
	dict[$r]=$((${dict[$r]}+1))
}

declare -A dict
dict[1]=0
dict[2]=0
dict[3]=0
dict[4]=0
dict[5]=0
dict[6]=0

while (( 1 ))
do
	roll_dice
	if [[ 10 =~ ^(${dict[1]}|${dict[2]}|${dict[3]}|${dict[4]}|${dict[5]}|${dict[6]})$ ]];
	then
		echo ${dict[@]}
		break
	fi
done

minC=10
for (( i=1; i<=6; i++ ))
do
	if [[ ${dict[$i]} -lt minC ]]
	then
		minC=${dict[$i]}
		min=$i
	fi
	if [[ ${dict[$i]} -eq 10 ]]
	then
		echo "$i came maximum times -> 10"
	fi
done

echo "$min came minimum times -> $minC"
