echo "Enter Year : "
read y;
if [[ $(($y%4)) == 0 ]];
then
	if [[ $(($y%100)) == 0 ]];
	then
		if [[ $(($y%400)) == 0 ]];
		then
			echo "$y is a leap year" 
		else
			echo "$y is not a leap year"
		fi
	else
		echo "$y is a leap year"
	fi
else 
	echo "$y is not a leap year"
fi
