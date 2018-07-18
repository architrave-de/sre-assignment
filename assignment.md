# assignment

## Preperations
Inside the folder `task` you'll find a Ansible playbook to provision a new server.
The task is built to be run in vagrant using VirtualBox or Parallels but you can use any local or cloud provider you like.

### Base server image
- Debian 8.x

### Services
- nginx
- PHP7.0
- MySQL5.6

### Prerequisites
- Vagrant v2.1
- Ansible v2.5.5
- VirtualBox / Parallels

### infrastructure setup
1. Clone the repository `git clone git@github.com:architrave-de/sre-assignment.git``
2. cd sre-assignment folder
3. run `vagrant up --provision`

To re-run the provisioner, run `vagrant provision` 

To access the instance via http/s use `http://architrave.local`

## Tasks
### Part 1: Ansible and basic Linux concepts
1. Provisioning of the playbook is broken, you should fix it in order to move forword when everything is working you should get `Ìnstance provisioned successfully` message. Take into account all aspects of the code
2. The system as it is allow all traffic to the server, create a role to limit access to the server via ports 80, 443 & 22 using iptables
3. Add http redirection so all traffic will be served via https
4. Make sure the client is not receiving the Nginx version as part of the http headers
5. Create user `testuser` with password `qweRTZ123`
6. Change the location of the website files to a more secure folder and grent `testuser` permissions to read the folder content

### Part 2: Docker
7. Create a new folder `docker` at the root of the repository
8. Migrate the code to docker using micro-services architecture, all the files should be stored inside the `docker` folder.
