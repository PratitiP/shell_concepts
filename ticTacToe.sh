#!/bin/bash -x

echo "Welcome to Tic-Tac-Toe"

declare -A board
board[0,0]=1
board[0,1]=2
board[0,2]=3
board[1,0]=4
board[1,1]=5
board[1,2]=6
board[2,0]=7
board[2,1]=8
board[2,2]=9

function print(){
	var=" "
	echo -e " ${board[0,0]} | ${board[0,1]} | ${board[0,2]}\n--- --- ---"
	echo -e " ${board[1,0]} | ${board[1,1]} | ${board[1,2]}\n--- --- ---"
	echo -e " ${board[2,0]} | ${board[2,1]} | ${board[2,2]}"
}

user=$((RANDOM%2))
if((user==0))
then
	symbolU='O'
	symbolC='X'
else
	symbolU='X'
	symbolC='O'
fi

print
echo "Your symbol is : $symbolU"

echo "We just had toss to decide who will play first : "
r=$((RANDOM%2))
if((r==0))
then 
	player=0
else
	player=1
fi

declare -A UC
UC[0]='O'
UC[1]='X'

if(($symbolU=='O'))
then
	if((player==1))
	then
		UC[0]='X'
		UC[1]='O'
	fi
elif(($symbolU=='X'))
then
	if((player=1))
	then
		UC[0]='X'
		UC[1]='O'
	fi
fi

echo "${UC[0]} ${UC[1]}"

f=0
while((f==0))
do
	if((player==0))
	then
		echo "You will play Now : "
		read move

	else
		echo "Computer will play Now : "
		read move
	fi

	case $move in
		1) if((${board[0,0]}=='X' || ${board[0,0]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[0,0]=${UC[$player]};;
		2) if((${board[0,1]}=='X' || ${board[0,1]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[0,1]=${UC[$player]};;
		3) if((${board[0,2]}=='X' || ${board[0,2]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[0,2]=${UC[$player]};;
		4) if((${board[1,0]}=='X' || ${board[1,0]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[1,0]=${UC[$player]};;
		5) if((${board[1,1]}=='X' || ${board[1,1]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[1,1]=${UC[$player]};;
		6) if((${board[1,2]}=='X' || ${board[1,2]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[1,2]=${UC[$player]};;
		7) if((${board[2,0]}=='X' || ${board[2,0]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[2,0]=${UC[$player]};;
		8) if((${board[2,1]}=='X' || ${board[2,1]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[2,1]=${UC[$player]};;
		9) if((${board[2,2]}=='X' || ${board[2,2]}=='0'))
			then
				echo "invalid position"
				continue
			fi
			board[2,2]=${UC[$player]};;
		*)
			echo "Enter valid position (1-9)";;
	esac

	print

	#check Winner
	if((${board[0,0]}==${UC[$player]} && ${board[0,1]}==${UC[$player]}))
	then 
		if((${board[0,2]}==${UC[$player]}))
		then	f=1
			winner=$player 
		fi
	elif((${board[1,0]}==${UC[$player]} && ${board[1,1]}==${UC[$player]}))
	then
		if((${board[1,2]}==${UC[$player]}))
		then	f=1
			winner=$player
		fi
	elif((${board[2,0]}==${UC[$player]} && ${board[2,1]}==${UC[$player]}))
	then
		if((${board[2,2]}==${UC[$player]}))		
		then	f=1
			winner=$player
		fi
   	elif((${board[0,0]}==${UC[$player]} && ${board[1,0]}==${UC[$player]}))
	then
		if((${board[2,0]}==${UC[$player]}))
		then	f=1
			winner=$player
		fi
	elif((${board[0,1]}==${UC[$player]} && ${board[1,1]}==${UC[$player]}))
	then
		if((${board[2,1]}==${UC[$player]}))
		then	f=1
			winner=$player
		fi
	elif((${board[0,2]}==${UC[$player]} && ${board[1,2]}==${UC[$player]}))
	then
		if((${board[2,2]}==${UC[$player]}))
		then	f=1
			winner=$player
		fi
	elif((${board[0,0]}==${UC[$player]} && ${board[1,1]}==${UC[$player]}))
	then
		if((${board[2,2]}==${UC[$player]}))
		then	f=1
			winner=$player
		fi
	elif((${board[0,2]}==${UC[$player]} && ${board[1,1]}==${UC[$player]}))
	then
		if((${board[2,0]}==${UC[$player]}))	
		then	f=1
			winner=$player
		fi
	fi

	if((player==0))
	then player=1
	else
		player=0
	fi
done

if((winner==0))
then
	echo "You are winner"
elif((winner==1))
then
	echo "Player 2 is winner"
fi
