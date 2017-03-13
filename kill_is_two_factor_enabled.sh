#!/bin/bash

###############################
### Step 5
###############################

### Note: Steps 1-3 in "is_two_factor_enabled.sh"

### What this does: wait a short period (5 seconds) to ensure that is_two_factor_enabled .sh is running, then kill its PID, then remove the scripts PID file, and finally get rid of the two temporary log files used to properly format the script
### Arguments used in bash
#	-x file_name: true if file exists and is executable
#	-v: verbose

sleep 5s && bash -x -v /tmp/kill_is_two_factor_enabled;

	### Result should be: 
	# Alexs-MacBook-Pro-4:~ ampodobas$ bash -x -v /tmp/kill_is_two_factor_enabled
	# kill -9 1499
	# + kill -9 1499
	#
	# [Process completed]


###############################
### Step 6
###############################

#What this does: replaces one from /var/log/is_two_factor_enabled.log with a single semicolon (delimiter):
tr '\n' ';' < /var/log/is_two_factor_enabled.log >> /var/log/is_two_factor_enabled.log;

#What this does: replaces one from /var/log/is_two_factor_enabled.log with a single semicolon (delimiter):
tr -d '\r' < /var/log/is_two_factor_enabled.log >> /var/log/is_two_factor_enabled.log;




