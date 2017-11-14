#!/bin/bash
## j - number of iterations
## i - left boundary
## rbound - right boundary


declare array=()
function sort_array()
{   
	(($# > 0)) && array=("$@")
	echo ""
	echo "The original array is: ${array[@]}"
	local j=0 rbound=$((${#array[*]} - 1 ))
	while ((rbound > 0))
	do
        	local i=0
        	while ((i < rbound))
        	do
			if [ "${array[$i]}" \> "${array[$((i + 1))]}" ]
			then
				local t="${array[$i]}"
				array[$i]="${array[$((i + 1))]}"
				array[$((i + 1))]="$t"
			fi
			((++i))
		done
		((++j))
		((--rbound))
	done
	echo "There were $j iterations"
}

# we call the function and provide unsorted elements as arguments

sort_array 3 9 2 7 8 1

echo "The sorted array is: ${array[@]}"
lenght=${#array[*]}
r=0
for ((i=0;i<$lenght;i++))
do 
       	if [ "${array[$i]}" -gt "$((r + 1))" ]; then
		echo "The missing number closest to 0 is $((${array[$((i - 1))]} + 1))"
		exit 1
       	else
		 ((++r)) 
       	fi  
done
