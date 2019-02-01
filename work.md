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
3. Main features of the original project while migrating to docker compose are preserved and are fully functional. However, there are few things still missing for example iptables. Few things has been elimated at this point of time just to keep the size of the project in check and time limitation. However, missing stuff, if any, is not very complex to bring back into the project. However, refactoring and minor imporvement can still be made.

### Part 3:
1. Setting up the CDN, it will help first our cleints to serve the reuests fast (CDN's try serve cached content from the nearyby geo-location of cleint). Many CDN's provider nowadays (like Fastly) also try to mitigate DDOS attacks. Which is one less thing to worry about. 
2. Setting up the monitoring for the application (mainly focussed on performance of application) and the platform itself (where the application is running) to constantly keep an eye that application do not suffer underliying infrastructure/networking/over-resource-utilation issues. Also its very handy to observe if application is using resources at optimum. Too much resources always help but cost money? (graphite, prometheus, etc can be used to collect metrices of infra and applications)
3. After having all the useful metrices, its very critical to have accurate alerts. Both false positive and false negative can be a concern. We should also focus to not over load the system with too many unnecessary alerts, as it, increases the possibility of missing a critical alert.
4. Set up proper logging, although, metrices can provide useful insights to the system, but often in case of failure, we would need a proper logging set-up (example ELK). metrices may tell us something may go wrong with the system but its many a times detail logs which reveal the real issues.
5. Database should have persistent volume, and we should have redundancy of data, a replication cluster would be handy. But even a timely back-up/snapshots of data is still better than nothing.
6. True microservice architecture, what I mean by this is, just splitting a monolith into several smaller apps still has the problem if any of the app fail the whole system comes crashing down. While spiltting a monolith, if we can do asynchronous comm between the microservices. This way we might still save the system even if some app fails, although, this come with the caveat that may be its not very useful for real time data. Morever, its challenging but worth considering.
7. Set up vault/credhub/ etc for secret management.
8. CI/CD

 
