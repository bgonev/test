#!/bin/bash
#init of vars
big=0
max_len=0
len=0

function pass_check () {
array=($(echo $1|sed  's/\(.\)/\1 /g'))
#test if the string is alphanumeric only
if ! [[ "$1" =~ [^a-zA-Z0-9] ]]; then
	for i in "${array[@]}"
	do
		if ! [[ "$i" =~ [^A-Z] ]]
        	then
			big=1
			((++len))
		else
			if ! [[ "$i" =~ [^a-z] ]]
			then
				((++len))
			else
			#	echo "we have number"
 				if [ "$len" -gt "$max_len" -a "$big" -gt "0" ]
				then
					max_len=$len
					len=0
				else
                                        len=0
				fi
			fi
		fi
	done

	if [ "$max_len" -gt "0" -a "$max_len" -gt "$len" -a "$big" -gt "0" ]
	then 
		echo $max_len
	else	
		if [ "$len" -gt "0" -a "$big" -gt "0" ]
		then
			echo $len
		else
			echo "-1"
		fi
	fi
else
	echo "-1"
fi
}


#call the function fith string as parameter

pass_check baaaa4dJdf32aa
