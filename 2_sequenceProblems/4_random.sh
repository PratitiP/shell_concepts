#!/bin/bash -x
diff=$((99-10+1))
a=$(($(($RANDOM%diff))+10));
b=$(($(($RANDOM%diff))+10))
c=$(($(($RANDOM%diff))+10))
d=$(($(($RANDOM%diff))+10))
e=$(($(($RANDOM%diff))+10))

sum=$(($a+$b+$c+$d+$e));
avg=$(($sum/5));

echo "sum = $sum , avg = $avg";
