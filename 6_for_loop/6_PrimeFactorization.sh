echo Enter a no to get prime factors : 
read n

for (( ; $(($n%2)) == 0 ; ))
do
	if [[ $(($n%2)) == 0 ]];
	then 
		echo 2
		n=$(($n/2))
	fi
done

for (( i=3 ; $(($i*$i)) <= $n ; i=$(($i+2)) ))
do
	for (( ; $(($n%$i)) == 0 ; ))
	do
		echo $i
		n=$(($n/$i))
	done
done

if [[ $n > 2 ]];
then echo $n
fi
