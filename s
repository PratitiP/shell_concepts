#!/bin/bash  -x

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


playerPos=(
    ["1"]=0
    ["2"]=0
)

dieRolls[1]=0
dieRolls[2]=0



declare -A snakes
declare -A ladders

snakes[62]=18
snakes[36]=6
snakes[32]=10
snakes[97]=78
snakes[95]=56
snakes[48]=26

ladders[2]=38
ladders[4]=14
ladders[21]=42
ladders[28]=76
ladders[50]=67
ladders[88]=99
ladders[71]=92

read -p "Two Players ? : " isTwoPlayers

function printTable(){
    local ele=$1

    if [ -v snakes[$ele] ]
    then
        echo -ne "$(tput setab 1)$ele$(tput sgr0)\t"
    elif [ -v ladders[$ele] ]
    then
        echo -ne "$(tput setab 2)$ele$(tput sgr0)\t"
    elif [ $(indexOf "$(declare -p snakes)" $ele) != "NULL" ]
    then
        echo -ne "$(tput setaf 1)$ele$(tput sgr0)\t"
    elif [ $(indexOf "$(declare -p ladders)" $ele) != "NULL" ]
    then
        echo -ne "$(tput setaf 2)$ele$(tput sgr0)\t"
    else
        echo -ne "$ele \t"
    fi
}

player="1"
while [ ${playerPos[$player]} -ne 100 ] && [ ${playerPos["2"]} -ne 100 ] 
do

    echo -e "\n\n\n"
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
        echo -e "\n\n\n"



    echo -ne "Snakes List : "
    for snake in ${!snakes[@]}
    do
        echo -ne "$(tput setab 1)$snake$(tput sgr0)  to  $(tput setaf 1)${snakes[$snake]}$(tput sgr0), "
    done


    echo -ne "\nLadders List : "
    for ladder in ${!ladders[@]}
    do
        echo -ne "$(tput setab 2)$ladder$(tput sgr0)  to  $(tput setaf 2)${ladders[$ladder]}$(tput sgr0), "
    done

    echo -e "\n\n"
    read -ep "Player $player Click any key to roll a die : " ip

    dieMove=$((1 + RANDOM % 6))
    clear
    echo "You got $dieMove"

    if [ $((${playerPos[$player]} + $dieMove)) -le 100 ]
    then
        moves+=("Player $player : ${playerPos[$player]} to $((${playerPos[$player]} + $dieMove))")
        playerPos[$player]=$((${playerPos[$player]} + $dieMove))
    else
         moves+=("Player $player : ${playerPos[$player]} to ${playerPos[$player]} No Move ")
    fi
    if [ -v snakes[${playerPos[$player]}] ]
    then
         moves+=("Player $player : ${playerPos[$player]} to ${snakes[${playerPos[$player]}]} Snake Bite")
        playerPos[$player]=${snakes[${playerPos[$player]}]}
        echo "Hurray You were caught by snake"

    elif [ -v ladders[${playerPos[$player]}] ]
    then
         moves+=("Player $player : ${playerPos[$player]} to ${ladders[${playerPos[$player]}]} Ladder")
        playerPos[$player]=${ladders[${playerPos[$player]}]}
        echo "Great You got a ladder keep going"
    fi


    echo "Player 1 in ${playerPos["1"]}"

    if [ $isTwoPlayers == "y" ]
    then
        echo "Player 2 in ${playerPos["2"]}"
    fi

    ((dieRolls[player]++))
    if [ $isTwoPlayers == "y" ]
    then
        case $player in 
            "2") player="1";;
            "1") player="2";;
        esac
    fi
done

clear 

if [ ${playerPos["1"]} -gt ${playerPos["2"]} ]
then
    echo "Player 1 Won the game"
else
    echo "Player 2 Won the game"
fi


echo Report :

echo -ne "Total Moves : \nPlayer 1 => ${dieRolls[1]}\nPlayer 2 => ${dieRolls[2]}\n"

echo Player Moves

( IFS=$'\n'; echo "${moves[*]}" )


