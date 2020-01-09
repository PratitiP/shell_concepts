function degF-C(){
	var=$1
	echo "Enter value between (32 - 212) for $var conversion"
	read degF
	if (( (degF >= 32) && (degF <= 212) ))
	then
		degC=`echo "scale=2; $(($degF-32))*5/9" | bc`
		echo "$degF F = $degC C"
	else
		echo Input is not within Freezing point
	fi
}

function degC-F(){
	var=$1
	echo "Enter value between (0 - 100) for $var conversion"
	read degC
	if (( (degC >= 32) && (degC <= 212) ))
	then
		degF=`echo "scale=2; $(($degC*9))/5+32" | bc`;
		echo "$degC C = $degF F"
	else
		echo Input is not within Freezing point
	fi
}

select var in degF-degC degC-degF
do
	echo $var
	case $var in
		'degF-degC')
			degF-C $var
			;;
		'degC-degF')
			degC-F $var
			;;
		*)
			echo "Wrong input";;
	esac
done
