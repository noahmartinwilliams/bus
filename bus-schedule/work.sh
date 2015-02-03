#! /bin/bash

[ -d trips ] || mkdir trips
cat stop_times.txt | sed '1d' | while read X;
do
	ROW=$(echo $X | cut -f 1,2,3,4,5 -d ',')
	TRIP_ID=$(echo "$ROW" | cut -f 1 -d ',')
	echo "$ROW" >>trips/$TRIP_ID
done
