#!/bin/bash -x

echo -e "============================\nWelcome to Tic-Tac-Toe\n============================"

#tic-tac-toe board
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
	echo -e " ${board[0,0]} | ${board[0,1]} | ${board[0,2]}\n--- --- ---"
	echo -e " ${board[1,0]} | ${board[1,1]} | ${board[1,2]}\n--- --- ---"
	echo -e " ${board[2,0]} | ${board[2,1]} | ${board[2,2]}"
}

#check if any player wins
function checkWinner(){
	if [[ "${board[0,0]}" == "${UC[$player]}" && "${board[0,1]}" == "${UC[$player]}" && "${board[0,2]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player
		return 
	fi
	if [[ "${board[1,0]}" == "${UC[$player]}" && "${board[1,1]}" == "${UC[$player]}" && "${board[1,2]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player
		return 
	fi
	if [[ "${board[2,0]}" == "${UC[$player]}" && "${board[2,1]}" == "${UC[$player]}" && "${board[2,2]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return
	fi	
	if [[ "${board[0,0]}" == "${UC[$player]}" && "${board[1,0]}" == "${UC[$player]}" && "${board[2,0]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return
	fi 	
	if [[ "${board[0,1]}" == "${UC[$player]}" && "${board[1,1]}" == "${UC[$player]}" && "${board[2,1]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return
	fi	
	if [[ "${board[0,2]}" == "${UC[$player]}" && "${board[1,2]}" == "${UC[$player]}" && "${board[2,2]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return
	fi	
	if [[ "${board[0,0]}" == "${UC[$player]}" && "${board[1,1]}" == "${UC[$player]}" && "${board[2,2]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return		
	fi	
	if [[ "${board[0,2]}" == "${UC[$player]}" && "${board[1,1]}" == "${UC[$player]}" && "${board[2,0]}" == "${UC[$player]}" ]]
	then
		f=1
		winner=$player 
		return		
	fi	
}

#get winning move
function getWinMove(){
	symbol=${UC[$1]}
	if(($1==1))
	then symbolOpp="${UC[0]}"
	else symbolOpp="${UC[1]}"
	fi
	winMove=0
	#check all rows
	for((i=0;i<3;i++))
	do
		if [[ ( "${board[$i,0]}" == "${board[$i,1]}" && "${board[$i,0]}" == "$symbol" ) || ( "${board[$i,0]}" == "${board[$i,2]}" && "${board[$i,0]}" == "$symbol" ) || ( "${board[$i,1]}" == "${board[$i,2]}" && "${board[$i,1]}" == "$symbol" ) ]]
		then
			for((j=0;j<3;j++))
			do
				if [[ "${board[$i,$j]}" == "$symbol" ]]
				then	continue
				elif [[ "${board[$i,$j]}" == "$symbolOpp" ]]
				then	break
				else	
				#winMove
				#board[$i,$j]="$symbol"
				winMove="$i,$j"
				return 1
				fi
			done
		fi
	done

	#check all columns
	for((i=0;i<3;i++))
	do
		if [[ ("${board[0,$i]}" == "${board[1,$i]}" && "${board[0,$i]}" == "$symbol" ) || ( "${board[0,$i]}" == "${board[2,$i]}" && "${board[0,$i]}" == "$symbol" ) || ( "${board[1,$i]}" == "${board[2,$i]}" && "${board[1,$i]}" == "$symbol" ) ]]
		then
			for((j=0;j<3;j++))
			do
				if [[ "${board[$j,$i]}" == "$symbol" ]]
				then	continue
				elif [[ "${board[$j,$i]}" == "$symbolOpp" ]]
				then	break
				else	
				#winMove
				#board[$j,$i]="$symbol"
				winMove="$j,$i"
				return 1
				fi
			done
		fi
	done

	#check for \ diagonal
	if [[ ( "${board[0,0]}" == "${board[1,1]}" && "${board[0,0]}" == "$symbol" ) || ( "${board[0,0]}" == "${board[2,2]}" && "${board[0,0]}" == "$symbol" ) || ( "${board[1,1]}" == "${board[2,2]}" && "${board[1,1]}" == "$symbol" ) ]]
	then
		if [[ "${board[0,0]}" != "$symbolOpp" && "${board[0,0]}" != "$symbol" ]]
		then	#board[0,0]="$symbol"
			winMove="0,0"
			return 1
		elif [[ "${board[1,1]}" != "$symbolOpp" && "${board[1,1]}" != "$symbol" ]]
		then	#board[1,1]="$symbol"
			winMove="1,1"
			return 1
		elif [[ "${board[2,2]}" != "$symbolOpp" && "${board[2,2]}" != "$symbol" ]]
		then	#board[2,2]="$symbol"
			winMove="2,2"
			return 1
		fi
	fi

	#check for / diagonal
	if [[ ( "${board[0,2]}" == "${board[1,1]}" && "${board[0,2]}" == "$symbol" ) || ( "${board[0,2]}" == "${board[2,0]}" && "${board[0,2]}" == "$symbol" ) || ( "${board[1,1]}" == "${board[2,0]}" && "${board[1,1]}" == "$symbol" ) ]]
	then
		if [[ "${board[0,2]}" != "$symbolOpp" && "${board[0,2]}" != "$symbol" ]]
		then	#board[0,2]="$symbol"
			winMove="0,2"
			return 1
		elif [[ "${board[1,1]}" != "$symbolOpp" && "${board[1,1]}" != "$symbol" ]]
		then	#board[1,1]="$symbol"
			winMove="1,1"
			return 1
		elif [[ "${board[2,0]}" != "$symbolOpp" && "${board[2,0]}" != "$symbol" ]]
		then	#board[2,0]="$symbol"
			winMove="2,0"
			return 1
		fi
	fi
	#if winMove not available	
	return 0
}

function checkCorners(){
	symbol=${UC[$1]}
	if(($1==1))
	then symbolOpp="${UC[0]}"
	else symbolOpp="${UC[1]}"
	fi
	cornerMove=0
	if [[ "${board[0,0]}" != "$symbolOpp" && "${board[0,0]}" != "$symbol" ]]
	then	board[0,0]="$symbol"
		cornerMove="0,0"
		return 1
	fi
	if [[ "${board[0,2]}" != "$symbolOpp" && "${board[0,2]}" != "$symbol" ]]
	then	board[0,2]="$symbol"
		cornerMove="0,2"
		return 1
	fi
	if [[ "${board[2,0]}" != "$symbolOpp" && "${board[2,0]}" != "$symbol" ]]
	then	board[2,0]="$symbol"
		cornerMove="2,0"
		return 1
	fi
	if [[ "${board[2,2]}" != "$symbolOpp" && "${board[2,2]}" != "$symbol" ]]
	then	board[2,2]="$symbol"
		cornerMove="2,2"
		return 1
	fi
	#look for center if corner not available
	centerMove=0
	if [[ "${board[1,1]}" != "$symbolOpp" && "${board[1,1]}" != "$symbol" ]]
	then	board[1,1]="$symbol"
		centerMove="1,1"
		return 1
	fi
	return 0
}

function checkSides(){
	symbol=${UC[$1]}
	if(($1==1))
	then symbolOpp="${UC[0]}"
	else symbolOpp="${UC[1]}"
	fi
	sideMove=0
	if [[ "${board[1,0]}" != "$symbolOpp" && "${board[1,0]}" != "$symbol" ]]
	then	board[1,0]="$symbol"
		sideMove="1,0"
		return 1
	fi
	if [[ "${board[0,1]}" != "$symbolOpp" && "${board[0,1]}" != "$symbol" ]]
	then	board[0,1]="$symbol"
		sideMove="0,1"
		return 1
	fi
	if [[ "${board[1,2]}" != "$symbolOpp" && "${board[1,2]}" != "$symbol" ]]
	then	board[1,2]="$symbol"
		sideMove="1,2"
		return 1
	fi
	if [[ "${board[2,1]}" != "$symbolOpp" && "${board[2,1]}" != "$symbol" ]]
	then	board[2,1]="$symbol"
		sideMove="2,1"
		return 1
	fi
	return 0
}

user=$((RANDOM%2))
if((user==0))
then
	symbolU="O"
	symbolC="X"
else
	symbolU="X"
	symbolC="O"
fi

#initial steps to assign user symbol and toss for first play
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

declare -A UC
UC[0]="O"
UC[1]="X"

if [[ "$symbolU" == "O" ]]
then
	if((player==1))
	then
		UC[1]="X"
		UC[0]="O"
	elif(($player==0)) 
	then
		UC[0]="O"
		UC[1]="X"
	fi
fi
if [[ "$symbolU" == "X" ]]
then
	if((player==1))
	then
		UC[0]="X"
		UC[1]="O"
	elif((player==0))
	then
		UC[0]="X"
		UC[1]="O"
	fi
fi

#game logic
f=0
iterations=1
while((f==0 && iterations<=9))
do
	if((player==0))
	then
		echo -e "-----------------------------"		
		echo "You will play Now (${UC[0]}) : "
		read move

	else
		echo -e "-----------------------------"
		echo "Computer played (${UC[1]}) : "
		winMove=0
		cornerMove=0
		centerMove=0
		sideMove=0
		getWinMove 1
		if [[ $? == 0 ]]
		then	
			getWinMove 0
			if [[ $? -ne 0 ]]
			then	
				board[$winMove]="${UC[1]}"
			else
				#check for corner & center move
				checkCorners 1
				if [[ $? -eq 0 ]]
				then
					#look for next move : side
					checkSides 1						
				fi				
			fi
		else	
			board[$winMove]="${UC[1]}"
		fi
	fi
	
	if((player==0))
	then
	case $move in
		1) if [[ ("${board[0,0]}" == "X") || ("${board[0,0]}" == "O") ]]
			then
				echo "invalid position"
				continue #prevent player switch
			fi
			board[0,0]="${UC[$player]}";;
		2) if((${board[0,1]}=='X' || ${board[0,1]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[0,1]="${UC[$player]}";;
		3) if((${board[0,2]}=='X' || ${board[0,2]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[0,2]="${UC[$player]}";;
		4) if((${board[1,0]}=='X' || ${board[1,0]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[1,0]="${UC[$player]}";;
		5) if((${board[1,1]}=='X' || ${board[1,1]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[1,1]="${UC[$player]}";;
		6) if((${board[1,2]}=='X' || ${board[1,2]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[1,2]="${UC[$player]}";;
		7) if((${board[2,0]}=='X' || ${board[2,0]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[2,0]="${UC[$player]}";;
		8) if((${board[2,1]}=='X' || ${board[2,1]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[2,1]="${UC[$player]}";;
		9) if((${board[2,2]}=='X' || ${board[2,2]}=='O'))
			then
				echo "invalid position"
				continue
			fi
			board[2,2]="${UC[$player]}";;
		*)
			echo "Enter valid position (1-9)";;
	esac
	fi
	print

	#check Winner
	checkWinner
	
	if((player==0))
	then player=1
	else
		player=0
	fi
	((iterations++))
done

if((iterations>9))
then
	echo "Ooooops....There is a tie"
elif((winner==0))
then
	echo "You are winner"
elif((winner==1))
then
	echo "Computer is winner"
fi
