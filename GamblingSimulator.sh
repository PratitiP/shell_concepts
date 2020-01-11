#!/bin/bash -x

#constants for gambling simulation
EVERY_DAY_START_STAKE=100
BET=1

stake=100

echo -e "Welcome to Gambling Simulator\n----------------------------"
echo -e "Every day Gambler can start with \$100\nEvery game you can bet \$1\n----------------------------"

randBet=$((RANDOM%2))
if ((randBet==1))
then
	echo "You won \$1"
	(( stake++ ))
else
	echo "You lost \$1"
	((stake--))
fi

echo "stake = \$$stake"
