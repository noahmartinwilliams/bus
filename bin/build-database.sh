#! /bin/bash

cd bus-schedule
wget http://developer.metro.net/gtfs/google_transit.zip
unzip google_transit.zip
cd ..
./bin/work.sh
./bin/work2.sh
./bin/work3.sh
cat bus-schedule/trips/*.database >database
