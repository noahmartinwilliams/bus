#! /bin/bash

cd trips/
for FILE in *;
do
	echo "$FILE"
	cat $FILE | sort -n -k 5 -t ',' >"$FILE".sorted
	mv "$FILE".sorted $FILE
done
