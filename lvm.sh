#!/bin/bash
# collect virtual drives
scan=$(pvscan --short|  pvscan --short | awk '/dev/')
# Split line into array
IFS=" " read -ra array <<< "$scan"

echo "${array[1]}"

# show all items of the array
#for index in "${!array[@]}"
#do
#    echo "$index ${array[index]}"
#done
