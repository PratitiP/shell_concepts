#!/bin/bash -x

echo "==============================="
echo "Welcome to Snakes and Ladder"
echo "==============================="
echo "        Two Player Game        "
echo "-------------------------------"

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

echo -e "\nLadders in the board : "
for i in ${!ladders[@]}
do
	echo -ne "$i\t###\t ${ladders[$i]}\n"
done


echo -e "\nSnakes in the board : "
for i in ${!snakes[@]}
do
	echo "$i ~~~ ${snakes[$i]}"
done

echo -e "\n-------------------------------"
echo -e "starting position :\nPlayer 1 : 0\nPlayer2 : 0"
echo -e "-------------------------------\n"

pos1=0
rollCount1=0
pos2=0
rollCount2=0
p=1


function indexOf(){
    local val=$2
    eval "declare -A arg_array="${1#*=}
    for index in "${!arg_array[@]}"
    do
        if [ "$val" == "${arg_array[$index]}" ]
        then
            echo $index
            return 0
        fi
    done
    echo NULL
}

function printTable(){
    local ele=$1
	color=$2

    if((color==5))
    then
	 echo -ne "$(tput setab 5)$ele$(tput sgr0)\t"
    elif((color==6))
    then 
	echo -ne "$(tput setab 6)$ele$(tput sgr0)\t"
    elif [ -v snakes[$ele] ]
    then
        echo -ne "$(tput setab 1)$ele$(tput sgr0)\t"
    elif [ -v ladders[$ele] ]
    then
        echo -ne "$(tput smul)$(tput setab 3)$ele$(tput sgr0)\t"
    elif [ $(indexOf "$(declare -p snakes)" $ele) != "NULL" ]
    then
        echo -ne "$(tput setaf 1)$ele$(tput sgr0)\t"
    elif [ $(indexOf "$(declare -p ladders)" $ele) != "NULL" ]
    then
        echo -ne "$(tput smul)$(tput bold)$(tput setaf 3)$ele$(tput sgr0)\t"
    else
        echo -ne "$ele \t"
    fi
}

function printBoard(){
    echo -e "\n\n"
    for ((i=9; i>=0;i--))
    do
        if [ $((i % 2)) -ne 0 ]
        then
            for ((j=i*10+10; j > (i*10) ; j--))
            do
                printTable $j
            done
        else
            for ((j=i*10 + 1; j <= (i*10 + 10) ; j++))
            do
                printTable $j
            done
        fi

        echo -e ""
    done
        echo -e "\n\n"
}

printBoard

while(( pos1<100 && pos2 <100 ))
do
	dice=$((RANDOM%6+1))
	echo dice = $dice

	if((p==1))
	then
		echo player $p
		(( rollCount1++ ))
		pos1=$((pos1+dice))
		if((pos1>100))
		then
			pos1=$((pos1-dice))
		fi

		if [ -v ladders[$pos1] ]
		then
			echo "got ladder"
			pos1=${ladders[$pos1]}
		elif [ -v snakes[$pos1] ]
		then
			echo "snake ate you"
			pos1=${snakes[$pos1]}
		fi
		#position after every die role
		echo -e "player $p is at = $pos1\n"
		winner=1
	elif((p=2))
	then
		echo -e "player $p"
		(( rollCount2++ ))
		pos2=$((pos2+dice))
		if((pos2>100))
		then
			pos2=$((pos2-dice))
		fi

		if [ -v ladders[$pos2] ]
		then
			echo "got ladder"
			pos2=${ladders[$pos2]}
		elif [ -v snakes[$pos2] ]
		then
			echo "snake ate you"
			pos2=${snakes[$pos2]}
		fi
		#position after every die role
		echo -e "player $p is at = $pos2\n"
		winner=2
	fi

	if((p==1))
	then p=2
	elif((p==2 || pos1==100 || pos2==100))
	then 
	p=1
	printTable $pos1 5
	printTable $pos2 6
	echo -e "\n---------------------------------"
	fi
done

if((winner==1))
then
	echo -e "\nGame Finished : \nPlayer 1 won the game with $rollCount1 rolls\n"
else
	echo -e "\nGame Finished : \nPlayer 2 won the game with $rollCount2 rolls\n"
fi

