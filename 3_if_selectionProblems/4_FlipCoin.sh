#!/bin/bash -x

flip_coin=$(($RANDOM%2));
echo $flip_coin
if [[ $flip_coin == 0 ]];
then
	echo "Its a tail"
else
	echo "Its a head"
fi
