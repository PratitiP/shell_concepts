#!/bin/bash -x

echo "Welcome to Tic-Tac-Toe"

declare -A board
board[0,0]=00
board[0,1]=01
board[0,2]=02
board[1,0]=10
board[1,1]=11
board[1,2]=12
board[2,0]=20
board[2,1]=21
board[2,2]=22

function print(){
	var=" "
	echo -e "${board[0,0]} |${board[0,1]} |${board[0,2]}\n--- --- ---"
	echo -e "${board[1,0]} |${board[1,1]} |${board[1,2]}\n--- --- ---"
	echo -e "${board[2,0]} |${board[2,1]} |${board[2,2]}"
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

