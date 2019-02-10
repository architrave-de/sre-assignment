# Work log

Please add in this file any implementation instructions, descriptions and implementation notes.

######## Question 3:
 What elements are missing to make this a 'production' ready system? Please list them in
 order of priority and add a short explanation.
#####################

Solution:

1. Using of ansible vaults for storing passwords or keys in encrypted files, rather than as plaintext in playbooks or roles.
2. Introduction of CDN [ Content Delivery network ] will increase the performance of the overall architecture as it caches the frequently accessed data from clients.
3. Monitoring of these servers is must as if any resource reaches it's threshold value there should be generation of alert which notifies us. Tools like NAGIOS, Prometheus. [ In docker environment we can do that using "Docker Stats" but alerst are not generated. "Prometheus", "Grafana" tools are there for monitoring.
4. We must have storage redundancy as well at storage layer. We can use NAS architecture for that "cDOT".
5. We must have load balancing and autoscaling for the architecture. This can be achieved by migrating current architecture to kubernetes.
6. Data backup for Mysql server.
7. External firewall is needed.
8. Before deploying in to production environment testing is to be done by QA/test engineer.
9. CI/CD Pipeline - We must follow complete agile process before deploying this in production using tools like "Jenkins", "TravisCI", "CircleCI" as : -
   Using Jenkins:---

   (i)   VCS ( Version Control System) [ GIT ]
   (ii)  Building code
   (iii) Testing [ Selenium, Cucumber ]
   (iv)  Deployment [ Ansible ]
   (v)   Monitoring [ NAGIOS, Prometheus, Grafana ]

########################################################################################################

What steps are needed to run the system on kubernetes? Please add a concise
description of involved steps. If time allows, start implementing it.

#########################################################################################################

By converting monolithic architecture to microservices architecture we can easily convert docker compose environment to kubernetes manifests.
Docker compose environment is created to test the architecture in dev environment.
This method is mainly used by developers for quick start to test the architecture. We can say lay base for us.
By doing so we can achieve 95% production environment.

We can also implement the whole architecture using StatefulSets in which all service will be tightly coupled.

Steps followed: - 

(i) Kompose = Kubernetes Compose-->  Converts docker-compose.yml to kubernetes resources.
(ii)  kompose --file docker-compose.yml convert -->  It converts the docker-compose file to kubernetes manifests.
(iii) kubectl create -f kubernetes --> It will run all pods and service.
(iv)  kubectl get services  --> To see running services.
(v)   kubectl get pods --> To see running pods

