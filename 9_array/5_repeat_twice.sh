##!/bin/bash -x
check_repeat_twice(){
	n=$1
	if [[ $(($n%11)) == 0 ]]
	then
		echo $n
	fi
}

echo "Nos. (0-100) which repeat twice : "
for (( i=1 ; i<100 ; i++))
do
	check_repeat_twice $i
done
