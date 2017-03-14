#!/bin/bash

### Instructions: replace YOUR_IPV4_TO_TEST with an IP address you wish to test

###############################
### Define IPs to check
###############################

### Each IPv4 within double quotes will be checked for two-factor authentication. Delimiter is whitespace. 
#TBD: declare -a arrayHosts=("some host" "another host");

###############################
### Step 1
###############################

### What this does: remove temporary file:
rm -rf /tmp/kill_is_two_factor_enabled_1

###############################
### Step 2
###############################

### What this does: invoke the script (separate file) used to to kill this script, which is necessary to exit from the input prompt (e.g., "password:" or "Verification code:") because this script operates as a non-interactive shell
sh ./kill_is_two_factor_enabled_1.sh &

###############################
### Step 3
###############################
### What this does: save the PID of this script ($$) and the kill command for it. Note that -9 can be replaced by any signal.
### Arguments used in bash command:
  	# -a: append the output to file or typescript, retaining the prior contents.
  
echo "kill -9" $$ > /tmp/kill_is_two_factor_enabled_1

###############################
### Step 4
###############################

#for host in "${arrayHosts[@]}"
#do
   
   #What this does: use script command to pass command argument to write output of SSH attempt, then remove certain undesired formatting:
   
   script -c "echo 'for YOUR_IPV4_TO_TEST'; ssh root@YOUR_IPV4_TO_TEST" -a /var/log/is_two_factor_enabled.log -f

#done 

### Note: Steps 5 and 6 are in "kill_is_two_factor_enabled" script. /var/log/is_two_factor_enabled.log is collected by Filebeat and sent to the ELK stack.



