#!/bin/bash
length=
i=0
declare array=()
function linked_array()
{
        (($# > 0)) && array=("$@")
        echo ""
        echo "The original array is: ${array[@]}"
	while [ "${array[$i]}" -ne "-1" ]
	do
	i="${array[$i]}"
	((++length))
	done
echo $((length+1))
}

linked_array 1 4 -1 3 2


