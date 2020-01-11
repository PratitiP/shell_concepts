#!/bin/bash -x

#constants for gambling simulation
EVERY_DAY_START_STAKE=100
BET=1

stake=100
startStake=100
noOfBets=0
echo -e "Welcome to Gambling Simulator\n----------------------------"
echo -e "Every day Gambler can start with \$100\nEvery game you can bet \$1\n----------------------------"

resignWin=$((startStake+startStake/2))
resignLost=$((startStake/2))
while(( (stake<resignWin) && (stake>resignLost) ))
do
	((noOfBets++))
	randBet=$((RANDOM%2))
	if ((randBet==1))
	then
		((stake++))
	else
		((stake--))
	fi
done

if((stake==resignWin))
then
	echo -e "You Won for the day\nYou played $noOfBets Bets to have stake = \$$stake"
else
	echo -e "You Lost for the day\nYou played $noOfBets Bets to have stake = \$$stake"
fi
