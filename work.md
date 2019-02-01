# Work log

## Naveen's assignment  Notes:

### Part 1:
1. Couple of bugs has been fixed including but not limited to fixing typo in mysql handler and passing `login_user` while setting root user creds for mysql. At this point ansible provisioning does not exit with any error. Moreover in commit `514ebb9` I have changed the task name, as it contained the updated password of root user. This should be avoided in genral.
2. Firewall(iptable confguration) role has been set up and ansible run seem to be successfull. The assignment ask for limiting the access to the server on port 80, 443 and 22. However whether to allow tcp or udp trrafic is not mentioned. Therefore, only tcp connections on these ports are configured. Also as port 80 (http), 443(https) and 22(ssh) works over tcp only. Important Note: Manual rebooting the system will result in loss of configured iptable rules, because iptable-restore (is used to load the iptables rule from the file) do not persist rules across the reboot.
3. Nginx configartion has been updated to redirect http trrafic to https, however redirection is done using the server name as apposed to host name. The reason for this host can be easily manipulated by client, I am bit skeptical about it.
4. Set `server_tokens` to off to remove the server version from the response.
5. Created test user in webserver. The task was straightforward except one has to keep in mind to not provide plaintext password to ansible while creating user. Used `mkpasswd --method=sha-512 required_password` to generate sha-512 hash of the user password.
6. Change the locatiion of default root of ngnix `/var/www` to `/srv/www`. One of the reason choosing directory `srv` is, this directory usually contain less clutter of files. Moreover, read access to `testuser` for this new directory.

### Part 2:
1. Split original project into 4 components, database, nginx, php-fpm and shared-data (shared by nginx and php-fpm).
2. Translated project into docker compose. which will also help in migrating code to kubernetes in relatively less time.
3. Main features of the original project while migrating to docker compose are preserved and are fully functional. However, there are few things still missing for example iptables, proper templating etc. Few things has been elimated at this point of time just to keep the size of the project in check and time limitation. However, missing stuff, if any, is not very complex to bring back into the project. More or less all challenging tasks has been done. However, refactoring and minor imporvement can still be made.
