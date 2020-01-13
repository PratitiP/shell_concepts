#!/bin/bash -x

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

function printTable(){
    local ele=$1

    if [ -v snakes[$ele] ]
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


player=0
pos=0
dice=$((RANDOM%6+1))
pos=$((pos+dice))
echo dice = $dice
echo player 1 is at = $dice
