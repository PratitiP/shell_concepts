#!/bin/bash -x

echo "Enter 1,10,100,1000,..... to get digits place"
read n

case $n in 
	1)echo Unit;;
	10)echo Ten;;
	100)echo Hundred;;
	1000)echo Thousand;;
	10000)echo Ten Thousand;;
	100000)echo Lacs;;
	1000000)echo Ten Lacs;;
	*)echo "Not valid input";;
esac

