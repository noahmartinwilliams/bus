#! /bin/bash

cd trips
for FILE in *;
do
	PREV_LINE=""
	cat $FILE | sed 's/://g' | cut -f 1,2,3,4 -d ',' | while read LINE;
	do
		if [ -z "$PREV_LINE" ];
		then
			PREV_LINE="$LINE"
			continue;
		else
			TRIP_ID=$(echo "$PREV_LINE"  | cut -f 1 -d ',')
			TRIP_START=$(echo "$PREV_LINE" | cut -f 3 -d ',')
			TRIP_END=$(echo "$LINE" | cut -f 2 -d ',')
			START_ID=$(echo "$PREV_LINE" | cut -f 4 -d ',')
			END_ID=$(echo "$LINE" | cut -f 4 -d ',')
			echo "byBus($START_ID, $END_ID, \"$TRIP_ID\", $TRIP_START, $TRIP_END)." >>"$FILE".database
			PREV_LINE=$LINE
		fi
	done
done
