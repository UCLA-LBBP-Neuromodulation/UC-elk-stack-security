#!/bin/bash

###############################
### Step 4
###############################

### Note: Steps 1-3 in "is_two_factor_enabled.sh"

### What this does: wait a short period (5 seconds) to ensure that is_two_factor_enabled .sh is running, then kill its PID, then remove the scripts PID file, and finally get rid of the two temporary log files used to properly format the script
### Arguments used in bash command:
#	-x file_name: true if file exists and is executable
#	-v: verbose

sleep 5s && bash -x -v /tmp/kill_is_two_factor_enabled_1;

	### Result should be: 
	# Alexs-MacBook-Pro-4:~ ampodobas$ bash -x -v /tmp/kill_is_two_factor_enabled
	# kill -9 1499
	# + kill -9 1499
	#
	# [Process completed]


###############################
### Step 5
###############################

### What this does: Remove Google Auth warning that causes unnecessary message. We just want to know if the response has "Verification code:"
sed -i '/POSSIBLE BREAK-IN ATTEMPT/d' /var/log/is_two_factor_enabled.log;

### What this does: Ensure that ^M (returns) are deleted
sed -i 's/\r$//g' /var/log/is_two_factor_enabled.log;
sed -i 's/^M//g' /var/log/is_two_factor_enabled.log;

### What this does: collapse all lines into a single line
sed -i ':a;N;$!ba;s/\n/ /g' /var/log/is_two_factor_enabled.log;

### What this does: create a newline for every text string starting with "Sript started at" to put runs of this script on one line
sed -i 's/Script started/\n&/g' /var/log/is_two_factor_enabled.log;

###############################
### Step 6
###############################

### What this does: simulate a return command
echo -ne '\n'

### What this does: kill the script
exit;
