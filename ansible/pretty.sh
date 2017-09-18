#!/bin/bash
echo '<html><head><style>table, th, td {border: 1px solid black; border-collapse: collapse;}</style></head><body><table style='width:50%'><tr><th>Package</th><th>Version</th></tr>'

while read l; do
	pkg=$(echo $l | cut -d ' ' -f2 | cut -d '}' -f1 | cut -d 'u' -f2)
	ver=$(echo $l | cut -d '[' -f2 | cut -d ']' -f1 | cut -d 'u' -f2)
	if [ -z $ver ]; then
		echo '<tr><td>'$pkg'</td><td style='background-color:#FF0000'>'$ver'</td></tr>'	
	else
		echo '<tr><td>'$pkg'</td><td>'$ver'</td></tr>'
	fi
done < /tmp/sps.txt	
