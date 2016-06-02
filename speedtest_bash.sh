#!/bin/bash

bandwidth_checker()
{
	speedtest-cli --simple >> /home/pi/speedtest/log/.tmp.txt
	download_info=$(cat /home/pi/speedtest/log/.tmp.txt | grep 'Download' | awk '{print $2}')
	upload_info=$(cat /home/pi/speedtest/log/.tmp.txt | grep 'Upload' | awk '{print $2}')
	ping_info=$(cat /home/pi/speedtest/log/.tmp.txt | grep 'Ping' | awk '{print $2}')
	echo $(date +%d-%m-%y)","$(date +%H-%M)","$download_info","$upload_info","$ping_info >> /home/pi/speedtest/log/speedtest_log.csv
}

if ls -a /home/pi/speedtest/log/ | grep -q 'speedtest_log.csv'; then bandwidth_checker

else

	touch "/home/pi/speedtest/log/speedtest_log.csv"
	echo "Date,Time,Download,Upload,Ping" > /home/pi/speedtest/log/speedtest_log.csv
	bandwidth_checker

fi

#import into mysql database
IFS=,
while read column1 column2 column3 column4 column5
		do
			echo "INSERT INTO speedtest_log (column1,column2,column3,column4,column5) VALES ('$column1', '$column2', '$column3', '$column4', '$column5');"
done < speedtest_log.csv | mysql -u pi -p DR%ft6GY&hu8 mydata;
