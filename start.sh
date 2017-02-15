#! /bin/bash

iceweasel https://www.hostedgraphite.com/c92bc7a5/6dfbfade-8ed2-4e92-8a3e-e39de351f570/grafana/dashboard/db/vertica-db-metrics &
sleep 15;
iceweasel https://www.hostedgraphite.com/c92bc7a5/6dfbfade-8ed2-4e92-8a3e-e39de351f570/grafana/dashboard/db/jenkins4-metrics &
sleep 15;
xdotool key --clearmodifiers F11;
sleep 30;
while true: do
	xdotool key ctrl+Tab;
	sleep 300
done &
