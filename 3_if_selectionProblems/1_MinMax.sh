diff=$((999-100+1));
a=$(($(($RANDOM%diff))+100));
b=$(($(($RANDOM%diff))+100));
c=$(($(($RANDOM%diff))+100));
d=$(($(($RANDOM%diff))+100));
e=$(($(($RANDOM%diff))+100));

if [[ $a > $b && $a > $c && $a > $d && $a > $e ]];
then max=$a;
elif [[ $b>$a && $b>$c && $b>$d && $b>$e ]];
then max=$b;
elif [[ $c>$a && $c>$b && $c>$d && $c>$e ]];
then max=$c;  
elif [[ $d>$a && $d>$b && $d>$c && $d>$e ]];
then max=$d; 
elif [[ $e>$a && $e>$b && $e>$c && $e>$d ]];
then max=$e; 
fi


if [[ $a<b && $a<$c && $a<$d && $a<$e ]];
then min=$a;
elif [[ $b<$a && $b<$c && $b<$d && $b<$e ]];
then min=$b;
elif [[ $c<$a && $c<$b && $c<$d && $c<$e ]];
then min=$c;  
elif [[ $d<$a && $d<$b && $d<$c && $d<$e ]];
then min=$d; 
elif [[ $e<$a && $e<$b && $e<$c && $e<$d ]];
then min=$e; 
fi

echo -e "random no. = $a, $b, $c, $d, $e \nmax = $max \nmin = $min"

