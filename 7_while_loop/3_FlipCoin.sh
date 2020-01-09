cH=0
cT=0

while (( (cH < 11) && (cT < 11) ))
do
	rand=$(($RANDOM%2))
	if [[ $rand -eq 0 ]]
	then 
		(( cT++ ))
	elif [[ $rand -eq 1 ]]
	then
		(( cH++ ))
	fi
done
echo -e "Head count = $cH   Tail count = $cT"
if [[ $cH -eq 11 ]]
then
	echo "won with 11 Heads"
elif [[ $cT -eq 11 ]]
then	echo "won with 11 Tails"
fi

