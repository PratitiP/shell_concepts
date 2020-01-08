
one_ft=12;
in=42
printf '42in = %.3f ft\n' $(echo "$in/$one_ft" | bc -l)

echo "area of 25 plots (60'x40') = " $((25*60*40));

