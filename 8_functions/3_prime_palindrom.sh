function check_Prime(){
	n=$1
	isPrime=0
	for (( i=2 ; i <= `expr $n / 2` ; i++ ))
	do 
		#echo `expr $n % $i`
		if [[ `expr $n % $i` == 0 ]];
		then 
			isPrime=1
			break
		fi
	done

	if [[ $isPrime == 1  ]];
	then echo $n is not Prime
	else
		echo $n is Prime
	fi
}

function get_Palindrom(){
	n=$1
	rev=`echo $n | rev`
	if [[ n -eq rev ]]
	then 
		echo "$n is palindrom"
		check_Prime $rev
	else echo "$n is not palindrom"
	fi
}

echo Enter a no. 
read n
check_Prime $n
get_Palindrom $n

