echo "enter month : " && read m && echo "enter day : " && read  d && echo "enter year : " && read y;
echo "$m/$d/$y" 

y0=$(($y-$((14-$m))/12));
echo "y0 = $y0"
x=$(($y0+$y0/4-$y0/100+$y0/400));
echo "x = $x"
m0=$(($m+12*$(($((14-$m))/12))-2));
echo "m0 = $m0"
d0=$(($(($d+$x+$((31*$m0))/12))%7));
echo "d0 = "$d0
