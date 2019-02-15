#########################################################

How to use

1. Create webserver deployment

  -->  kubectl create -f webserver.yml

2. Create webserver service

  --> kubectl create -f webserver-service.yml

3.  To check pods running

  --> kubectl get pods

4. Create mysql Persistentvolume

  --> kubectl create -f mysql-volumeclaim.yml

5. create mysql deployment

  --> kubecl create -f mysql.yml

6. Create mysql service

  --> kubectl create -f mysql-service.yml

7. Create webserver service 

  --> kubectl create -f webserver-service.yml 
