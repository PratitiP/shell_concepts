echo enter value to convert 
read v
echo -e "Select no. for unit conversion : \n1.Feet to inch\t\t3.inch to feet\n2.Feet to meter\t\t4.Meter to feet"
read n

case $n in
	1)
		v1=`echo "scale=2; $v * 12" | bc`
		echo "$v inch = $v1 ft";;
	3)	
		v1=`echo "scale=2; $v / 12" | bc`
		echo "$v inch = $v1 ft";;
	2)
		v1=`echo "scale=2; $v / 3.28" | bc`
		printf "$v ft = %.2f meter" $v1;;
	4)
		v1=`echo "scale=2; $v * 3.28" | bc`
		printf "$v meter = %.2f ft" $v1;;
	*)
		echo "invalid input"
esac
