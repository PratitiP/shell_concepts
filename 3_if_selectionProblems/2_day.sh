#!/bin/bash -x

#echo "enter day : " && read d && echo "enter month : " && read m ;
d=$1
m=$2
if (( (m>2) && (m<7) ))
then 
	if (( (d<20 && m==3) || (d>20 && m==6) ))
	then	
		echo "false - date is not in between March20 & June20"
	else	
		echo "true - date is in between March20 & June20"
	fi
else
	echo "false - date is not in between March20 & June20"
fi

