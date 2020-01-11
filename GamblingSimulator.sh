#!/bin/bash -x

#constants for gambling simulation
EVERY_DAY_START_STAKE=100
BET=1

echo -e "Welcome to Gambling Simulator\n----------------------------"
echo -e "Every day Gambler can start with \$100\nEvery game you can bet \$1\n----------------------------"

stakeWin=0
stakeLost=0
dayWin=0
dayLost=0
for(( i=1 ; i<=20 ; i++ ))
do
	startStake=$EVERY_DAY_START_STAKE
	stake=$startStake
	noOfBets=0
	resignWin=$((startStake+startStake/2))
	resignLost=$((startStake/2))
	while(( (stake<resignWin) && (stake>resignLost) ))
	do
		((noOfBets++))
		randBet=$((RANDOM%2))
		if ((randBet==1))
		then
			stake=$((stake+BET))
		else
			stake=$((stake-BET))
		fi
	done
	if((stake==resignWin))
	then
		stakeWin=$((stakeWin+stake))
		echo -e "You Won for the day $i\nYou played $noOfBets Bets to have stake = \$$stake"
		echo "Total amount Won = \$$stake"
		((dayWin++))
	else
		stakeLost=$((stakeLost+stake))
		echo -e "You Lost for the day $i\nYou played $noOfBets Bets to have stake = \$$stake"
		echo "Total amount Lost = \$$stake"
		((dayLost++))
	fi
done

echo -e "------------------------\nAfter a month\n-----------------------"
echo -e "No of days you won the game =  $dayWin days\nTotal amount Won = $stakeWin"
echo -e "No of days you lost the game = $dayLost days\nTotal amount Lost = $stakeLost"

