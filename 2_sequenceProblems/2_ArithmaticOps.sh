#!/bin/bash -x
read -p "Enter 3 nos.: " a  b  c;
echo "a="$a "b=" $b "c=" $c;
echo "a+b*c = " $(($a+$b*$c));
echo "c+a/b = " $(($c+$a/$b));
echo "a%b+c = " $(($a%$b+$c));
echo "a*b+c = " $(($a*$b+$c));
