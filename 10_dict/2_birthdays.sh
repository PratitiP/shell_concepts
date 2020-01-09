function get_birth_months(){
	r=$(($(($RANDOM%12))+1))
	dict[$r]=$((${dict[$r]}+1))
}

declare -A dict
for (( i=1 ; i<=12 ; i++))
do
	dict[$i]=0
done

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

echo "${!dict[@]}"
