#!/usr/bin/expect

set timeout 5
set LOGFILE /var/log/reboot-rg.log

log_file -a $LOGFILE

spawn telnet <IP Address to PDU>

send_log "\n[exec date] Starting Reboot Script\n"

# TELNET TO WTI PDU
send_log "\n[exec date] Logging into PDU\n"
expect "Password:"
send "<your password here>\r"
sleep 2

# TURN OFF PLUG 6
send_log "\n[exec date] Turning off RG outlet\n"
expect "IPS> "
send "/Off 6\r"
expect "(Y/N): "
send "Y\r"
sleep 30

# TURN ON PLUG 6
send_log "\n[exec date] Turning on RG outlet\n"
expect "IPS> "
send "/On 6\r"
expect "(Y/N): "
send "y\r"
sleep 2

# LOG OFF
send_log "\n[exec date] Logging out of PDU\n"
expect "IPS> "
send "/X\r"
expect "(Y/N): "
send "y\r"

send_log "\n[exec date] End of script\n"

#close logfile
log_file

expect eof
