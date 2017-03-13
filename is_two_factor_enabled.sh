#!/bin/bash

###############################
### Define IPs to check
###############################

#Each IPv4 within double quotes will be checked for two-factor authentication. Delimiter is whitespace. 
#TBD: declare -a arrayHosts=("some host" "another host");

###############################
### Step 1
###############################

# What this does: removes the temporary files for the output of the script command
rm -rf /var/log/temp_2FAEnabled_*.log

###############################
### Step 2
###############################

# What this does: invoke the script (sepatate file) used to to kill this script, which is necessary to exit from the input prompt (e.g., "password:" or "Verification code:") because this script operates as a non-interactive shell
sh ./kill_is_two_factor_enabled.sh &

###############################
### Step 3
###############################
# What this does: save the PID of this script ($$) and the kill command for it. Note that -9 can be replaced by any signal
echo "kill -9" $$ > /tmp/kill_is_two_factor_enabled

###############################
### Step 4
###############################

#for host in "${arrayHosts[@]}"
#do
   
   #What this does: use script command to pass command argument to write output of SSH attempt, then remove certain undesired formatting:
   script -c  'ssh -T root@SOMEHOST' /var/log/is_two_factor_enabled.log;

#done 

### Note: Steps 5 and 6 are in "kill_is_two_factor_enabled" script. /var/log/is_two_factor_enabled.log is collected by Filebeat and sent to the ELK stack.
