echo Enter no to get 2^n upto 256
read n
i=0
ans=0
while [ $ans -lt 256 ]
do
	ans=$((2**$i))
	echo $ans
	(( i++ ))
done

