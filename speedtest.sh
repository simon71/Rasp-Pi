#!/bin/bash

NOW=$(date +"%d-%m-%y %T")

sudo sh -c "touch /speedtest.log"

file=/speedtest.log

if [ -e ${file} ]; then
	
	echo $file exists

	x=0

	while [ $x -le 450 ]; do
		
		sudo sh -c "echo $x >> /speedtest.log"

		sudo sh -c "echo 'Date: $NOW' >> /speedtest.log"

		sudo sh -c "speedtest-cli --simple --bytes >> /speedtest.log"

		sudo sh -c "echo ''"
		
		x=$(( $x + 1 ))
		
		sleep 10m
		
		if [ $x == 451 ]; then
			echo finished
			exit 0
		fi
	done
else
	echo '/speedtest.log doesnt exist'
	
	exit 1
fi

