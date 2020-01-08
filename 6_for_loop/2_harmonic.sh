echo Enetr n
read n
h_no=0

for (( i=1 ; i<=n ; i++ ))
do
	#i1=`echo "scale=2; 1 / $i" | bc`;
	h_no=`echo "scale=2; $h_no + 1 / $i" | bc`;
done

echo nth harmonic no is $h_no
