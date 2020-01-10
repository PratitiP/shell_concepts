#!/bin/bash -x

read -p "Enter 3 numbers : " a b c
echo $a $b $c
echo "a+b*c = $(( a + b * c ))"
echo "a*b+c = $(( a * b + c ))"
echo "c+a/b = $(( c + a / b ))"
echo "a%b+c = $(( a%b+c))"
