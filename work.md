# Work log

## Naveen's assignment  Notes:
### Part 1:
1. Couple of bugs has been fixed including but not limited to fixing typo in mysql handler and passing `login_user` while setting root user creds for mysql. At this point ansible provisioning does not exit with any error. Moreover in commit `514ebb9` I have changed the task name, as it contained the updated password of root user. This should be avoided in genral.
2. Firewall(iptable confguration) role has been set up and ansible run seem to be successfull. The assignment ask for limiting the access to the server on port 80, 443 and 22. However whether to allow tcp or udp trrafic is not mentioned. Therefore, only tcp connections on these ports are configured. Also as port 80 (http), 443(https) and 22(ssh) works over tcp only. Important Note: Manual rebooting the system will result in loss of configured iptable rules, because iptable-restore (is used to load the iptables rule from the file) do not persist rules across the reboot.
3. Nginx configartion has been updated to redirect http trrafic to https, however redirection is done using the server name as apposed to host name. The reason for this host can be easily manipulated by client, I am bit skeptical about it.
