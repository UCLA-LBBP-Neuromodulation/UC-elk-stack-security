# UC-elk-stack-security
The Neuromodulation division at the UCLA Semel Institute (UCLA Health), in conjunction with the UCLA Office of the President's information security division, is pleased to open-source our work on an information-security focused Elastic Stack (formerly known as the "ELK" stack) (https://www.elastic.co/).

Our customized Elastic (ELK) stack inregration is heavily security focused and includes the following. We have included our production Filebeat (sending log files), Packetbeat (sending packets and netflow), and Metricbeat (sending server metrics, such as storage and mysqld processes). 

### Two-factor Auth Checks  
(1) Checking if two-factor authentication is enabled (outputs to log, which is collected by Filebeat) on servers

### SSH:
(1) Logging all successful and failured multi-factor authentication (e.g., Google Authenticator) SSH events;
(2) Logging all successful and failured non-MFA SSH attempts;

### Users and Groups
(1) Creation and deletion of users
(2) Creation and deletion of groups
(3) Changing of passwords
(4) Successful and failed sudo attempts

### File Integrity
(1) Tracking file content change events, including before and after hashes
(2) Tracking the deletion of files 

### Netflow
(1) Integration with Elastic stack's Packetbeat with our own customizations to track netflow, including which IP addresses are experiencing anomalous spikes in traffic and hourly netflow
(2) Tracking data exfiltration events at certain MB thresholds
(3) Tracking which ports are used, including anomalous port events

### Firewalls and Ports
(1) Tracking the history of port openings and closures

### Heartbeat
(1) Integration of Elastic stack's new Beat ("Heartbeat") to conduct ICMP and HTTP "pings" to check for service and server uptime and response time

### Mail Events
(1) Tracking successful and failed Dovecot and Postfix mail events and error messages
