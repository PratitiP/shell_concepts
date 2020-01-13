#!/bin/bash -x

echo "==============================="
echo "Welcome to Snakes and Ladder"
echo "==============================="
echo "        One Player Game        "
echo "-------------------------------"
echo -e "starting position : 0\n"
declare -A snakes
declare -A ladders

snakes[36]=5
snakes[49]=7
snakes[56]=13
snakes[82]=20
snakes[87]=66
snakes[95]=38

ladders[4]=35
ladders[9]=51
ladders[23]=42
ladders[48]=86
ladders[62]=83
ladders[69]=91
ladders[76]=98

player=1
pos=0
while(( pos<=100 ))
do
	dice=$((RANDOM%6+1))
	echo dice = $dice
	pos=$((pos+dice))
	if [ -v ladders[$pos] ]
	then
		echo "got ladder"
		pos=${ladders[$pos]}
	elif [ -v snakes[$pos] ]
	then
		echo "snake ate you"
		pos=${snakes[$pos]}
	fi
	echo player 1 is at = $pos
done
