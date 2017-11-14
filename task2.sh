#!/bin/bash

#left boundary
lb=0
#right boundary
rb=100000000

function countone () {
	a=$1
	b=$2
	if [ "$a" -ge "$lb" -a "$a" -le "$rb" -a "$b" -ge "$lb" -a "$b" -le "$rb" ]; then  
		mult=$((a*b))
		binary=$(echo "obase=2;$mult" | bc)
		awk -F"1" '{print "Total quantity of 1 inside binary representation is: " NF-1}' <<< $binary
	else
		echo "Some of the multiplicators is out of range (1..100.000.000), exiting..."
	fi
}

countone 1030 323
