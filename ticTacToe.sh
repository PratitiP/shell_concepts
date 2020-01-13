#!/bin/bash -x

echo "Welcome to Tic-Tac-Toe"

function print(){
	var=" "
	echo -e "$var |$var |$var\n-- -- --"
	echo -e "$var |$var |$var\n-- -- --"
	echo -e "$var |$var |$var"
}

print
