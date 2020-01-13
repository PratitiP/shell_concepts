#!/bin/bash -x

echo "Welcome to Tic-Tac-Toe"

function print(){
	var=" "
	echo -e "$var |$var |$var\n-- -- --"
	echo -e "$var |$var |$var\n-- -- --"
	echo -e "$var |$var |$var"
}

user=$((RANDOM%2))
if((user==0))
then
	symbolU='0'
	symbolC='X'
else
	symbolU='X'
	symbolC='0'
fi

print
echo "Your symbol is : $symbolU"

echo "We just had toss to decide who will play first : "
r=$((RANDOM%2))
if((r==0))
then 
	player=0
	echo "You will play first"
else
	player=1
	echo "Computer will play first"
fi
