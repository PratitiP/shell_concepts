echo "Enter no 1,10,100,1000,... to get unit"
read n
if [[ $n == 1 ]];
then echo unit
elif [[ $n == 10 ]];
then echo ten
elif [[ $n == 100 ]];
then echo hundred
elif [[ $n == 1000 ]];
then echo thousand
elif [[ $n == 10000 ]];
then echo ten thousand
elif [[ $n == 100000 ]];
then echo lacs
elif [[ $n == 1000000 ]];
then echo ten lacs
else
echo Not valid no.
fi
