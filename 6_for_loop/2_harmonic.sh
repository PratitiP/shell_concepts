#!/bin/bash -x

h_no=0

for (( i=1 ; i<=$1 ; i++ ))
do
	h_no=`echo "scale=2; $h_no + 1 / $i" | bc`;
done

echo nth harmonic no is $h_no
