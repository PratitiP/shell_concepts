#!/bin/bash -x
function get_birth_months(){
	r=$(($(($RANDOM%12))+1))
	case $r in 
		1)dict['Jan']=$((${dict['Jan']}+1));;
		2)dict['Feb']=$((${dict['Feb']}+1));;
		3)dict['March']=$((${dict['March']}+1));;
		4)dict['April']=$((${dict['April']}+1));;
		5)dict['May']=$((${dict['May']}+1));;
		6)dict['June']=$((${dict['June']}+1));;
		7)dict['July']=$((${dict['July']}+1));;
		8)dict['Aug']=$((${dict['Aug']}+1));;
		9)dict['Sept']=$((${dict['Sept']}+1));;
		10)dict['Oct']=$((${dict['Oct']}+1));;
		11)dict['Nov']=$((${dict['Nov']}+1));;
		12)dict['Dec']=$((${dict['Dec']}+1));;
	esac
}

declare -A dict
dict=(['Jan']=0 ['Feb']=0 ['March']=0 ['April']=0 ['May']=0 ['June']=0 ['July']=0 ['Aug']=0 ['Sept']=0 ['Oct']=0 ['Nov']=0 ['Dec']=0)
echo ${!dict[@]}
c=1
while (( c <= 50))
do
	get_birth_months
	(( c++ ))
done

for i in ${!dict[@]}
do
	echo "Individuals having birthday in month $i = ${dict[$i]}"
done

