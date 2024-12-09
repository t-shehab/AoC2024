#!/bin/bash

column_1=($(awk '{print $1}' puzzle_input.txt | sort -n))
column_2=($(awk '{print $2}' puzzle_input.txt | sort -n))
length=${#column_1[@]}
result=0

for ((i = 0; i < ${length}; i++)); do
    left=${column_1[$i]}
    right=${column_2[$i]}

    if [[ ${left} -eq ${right} ]]; then
        difference=0
    elif [[ ${left} -gt ${right} ]]; then
        difference=$((left - right))
    else
        difference=$((right - left))
    fi

    result=$((result + difference))
done

echo "result is ${result}"
