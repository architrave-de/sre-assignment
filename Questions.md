Q. What elements are missing to make this a 'production' ready system? Please list them in order of priority and add a short explanation.
#################

1.  NTP Server: NTP Server should be installed and configured on production ready system. NTP can help to correlate the occurrence of event with specific time, which intern helps to debug multiple application logs on different servers.

2.  VM Swappiness: Default swapiness is set to 60, which does mean if RAM reaches 40% capacity, systems start swapping. Depends on the kind of application we are running, to improve the performance if we set the swapiness to 10, means if RAM reaches 90% capacity, then systems starts swapping. Ofcourse, for this server should have enough RAM available, this can drastically improve the performance. However this is just to set an  example. To find out best setting for any system, it requires quite experiment.

3.  Remove unnecessary packages: Lesser the code, lesser the chances of finding vulnerability in system
Ansible Become_user should not be root, we can mark become=yes and provide other user.

4. Nginx: LB should be the front end for end user. That shows strong improvemnt in performace. Also avoid by one server being overloaded and helps to expand the capacity very easily. Makes the software upgrade very easy.
    Enable static cache: We should confgure static cache in order to reduce bandwidth and improve performance.


Q.What steps are needed to run the system on kubernetes? Please add a concise description of involved steps. If time allows, start implementing it.
##################

In my opinion, Install Compose on Kubernetes controller. This allows us to deploy Docker Compose files onto a Kubernetes cluster.
Please refer: https://github.com/docker/compose-on-kubernetes
