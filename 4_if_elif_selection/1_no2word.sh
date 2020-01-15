#!/bin/bash -x

echo "enter single digit no : "
read n
if [[ $n == 0 ]];
then echo zero
elif [[ $n == 1 ]];
then echo one
elif [[ $n == 2 ]];
then echo Two
elif [[ $n == 3 ]];
then echo Three
elif [[ $n == 4 ]];
then echo Four
elif [[ $n == 5 ]];
then echo Five
elif [[ $n == 6 ]];
then echo Six
elif [[ $n == 7 ]];
then echo Seven
elif [[ $n == 8 ]];
then echo Eight
elif [[ $n == 9 ]];
then echo Nine
else echo Not a single digit no.
fi
