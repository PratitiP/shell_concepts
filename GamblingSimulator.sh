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
f=1
while((f==1))
do
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
			echo -e "You Won for the day $i = lucky day"
			#echo "You played $noOfBets Bets to have stake = \$$stake"
			echo -e "Total amount Won = \$$stake\n"
			((dayWin++))
		else
			stakeLost=$((stakeLost+stake))
			echo -e "You Lost for the day $i = Unlucky day"
			#echo "You played $noOfBets Bets to have stake = \$$stake"
			echo -e "Total amount Lost = \$$stake\n"
			((dayLost++))
		fi
	done

	echo -e "------------------------\nAfter a month\n-----------------------"
	echo -e "No of days you won the game =  $dayWin days\nTotal amount Won = $stakeWin"
	echo -e "No of days you lost the game = $dayLost days\nTotal amount Lost = $stakeLost"

	result=$((dayWin*50-dayLost*50))
	if((result>0))
	then
		echo "You Won for the month. Would you like to continue (y/n) : "
		read continue
		if [[ $continue == 'n' ]]
		then f=0
		fi
	else
		echo "You lost this month. You have to stop"
		f=0
	fi
done
