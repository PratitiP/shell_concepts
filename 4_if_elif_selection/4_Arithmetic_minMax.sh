#!/bin/bash -x

echo Enter 3 nos.
read n1 n2 n3
echo $n1 $n2 $n3
a=$(($n1+$n2*$n3))
b=$(($n1%$n2+$n3))
c=$(($n3+$n1/$n2))
d=$(($n1*$n2+$n3))

if [[ $a > $b && $a > $c && $a > $d ]];
then max=$a; maxOp=a;
elif [[ $b>$a && $b>$c && $b>$d ]];
then max=$b;maxOp=b;
elif [[ $c>$a && $c>$b && $c>$d ]];
then max=$c; maxOp=c;
elif [[ $d>$a && $d>$b && $d>$c ]];
then max=$d; maxOp=d;
fi


if [[ $a<b && $a<$c && $a<$d ]];
then min=$a; minOp=a;
elif [[ $b<$a && $b<$c && $b<$d ]];
then min=$b; minOp=b;
elif [[ $c<$a && $c<$b && $c<$d ]];
then min=$c;  minOp=c;
elif [[ $d<$a && $d<$b && $d<$c ]];
then min=$d;  minOp=d;
fi

echo -e "maxOp = $maxOp  max = $max \nminOp = $minOp  min = $min "
