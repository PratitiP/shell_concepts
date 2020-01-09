echo -e "Welcome to Gambling \nYou have Rs.100 \nYou can bet Rs.1 until you broke or get Rs.200"
winC=0
nBet=0
amount=100

while (( (amount > 90) && (amount < 120) ))
do
	(( nBet++ ))
	rand=$((RANDOM%2))
	if (( rand == 0 ))
	then
		(( amount-- ))
	elif (( rand == 1 ))
	then
		(( winC++ ))
		(( amount++ ))
	fi
done
echo -e "No of times you won = $winC\nAmount you have = $amount\nNo. of bets made = $nBet"

