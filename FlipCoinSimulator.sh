#!/bin/bash -x

r=$((RANDOM%2))
if (( r==1))
then echo Head
else
	echo Tail
fi
