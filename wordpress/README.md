cyborg@wcyborg:~$ kubectl create -f ./Kubernets/wordpress/
secret/mysql-secret created
persistentvolumeclaim/mysql-pvc created
persistentvolumeclaim/wordpress-pvc created
deployment.apps/mysql-deployment created
service/mysq-service created
service/wordpress-service created
deployment.apps/wordpress-deployment created


cyborg@wcyborg:~$ kubectl delete -f ./Kubernets/wordpress/
secret "mysql-secret" deleted
persistentvolumeclaim "mysql-pvc" deleted
persistentvolumeclaim "wordpress-pvc" deleted
deployment.apps "mysql-deployment" deleted
service "mysq-service" deleted
service "wordpress-service" deleted
deployment.apps "wordpress-deployment" deleted

cyborg@wcyborg:~$ kubectl create -f ./Kubernets/wordpress/
secret/mysql-secret created
persistentvolumeclaim/mysql-pvc created
persistentvolumeclaim/wordpress-pvc created
deployment.apps/mysql-deployment created
service/mysq-service created
service/wordpress-service created
deployment.apps/wordpress-deployment created

cyborg@wcyborg:~$ kubectl get secrets
NAME                  TYPE                                  DATA   AGE
default-token-gc4rx   kubernetes.io/service-account-token   3      156m
mysql-secret          Opaque                                1      11s

cyborg@wcyborg:~$ kubectl get deployments
NAME                   READY   UP-TO-DATE   AVAILABLE   AGE
mysql-deployment       1/1     1            1           35s
wordpress-deployment   1/1     1            1           34s

cyborg@wcyborg:~$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
mysql-deployment-7b4b74c88b-bvsqv       1/1     Running   0          18s
wordpress-deployment-69cdf58954-kpdqv   1/1     Running   0          17s

cyborg@wcyborg:~$ kubectl logs wordpress-deployment-69cdf58954-kpdqv
Warning: mysqli::mysqli(): php_network_getaddresses: getaddrinfo failed: Name or service not known in - on line 22

Warning: mysqli::mysqli(): (HY000/2002): php_network_getaddresses: getaddrinfo failed: Name or service not known in - on line 22

MySQL Connection Error: (2002) php_network_getaddresses: getaddrinfo failed: Name or service not known

.
.
.


cyborg@wcyborg:~$ kubectl delete -f ./Kubernets/wordpress/
secret "mysql-secret" deleted
persistentvolumeclaim "mysql-pvc" deleted
persistentvolumeclaim "wordpress-pvc" deleted
deployment.apps "mysql-deployment" deleted
service "mysq-service" deleted
service "wordpress-service" deleted
deployment.apps "wordpress-deployment" deleted


cyborg@wcyborg:~$ kubectl apply -f ./Kubernets/wordpress/wordpress-deployment.yaml 
deployment.apps/wordpress-deployment created

cyborg@wcyborg:~$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
wordpress-deployment-69cdf58954-bj5kz   0/1     Pending   0          71s

cyborg@wcyborg:~$ kubectl apply -f ./Kubernets/wordpress/
secret/mysql-secret created
persistentvolumeclaim/mysql-pvc created
persistentvolumeclaim/wordpress-pvc created
deployment.apps/mysql-deployment created
service/mysql-service created
service/wordpress-service created
deployment.apps/wordpress-deployment unchanged

cyborg@wcyborg:~$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
mysql-deployment-7b4b74c88b-cxllp       1/1     Running   0          50s
wordpress-deployment-69cdf58954-bj5kz   1/1     Running   0          3m56s

cyborg@wcyborg:~$ kubectl get services
NAME                TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes          ClusterIP      10.96.0.1      <none>        443/TCP        179m
mysql-service       ClusterIP      10.98.62.125   <none>        3306/TCP       88s
wordpress-service   LoadBalancer   10.101.43.95   <pending>     80:30654/TCP   88s

#não é preciso para clound

cyborg@wcyborg:~$ minikube service wordpress-service --url
http://192.168.49.2:30654


cyborg@wcyborg:~/Kubernets$ minikube addons list
|-----------------------------|----------|--------------|
|         ADDON NAME          | PROFILE  |    STATUS    |
|-----------------------------|----------|--------------|
| ambassador                  | minikube | disabled     |
| csi-hostpath-driver         | minikube | disabled     |
| dashboard                   | minikube | disabled     |
| default-storageclass        | minikube | enabled ✅   |
| efk                         | minikube | disabled     |
| freshpod                    | minikube | disabled     |
| gcp-auth                    | minikube | disabled     |
| gvisor                      | minikube | disabled     |
| helm-tiller                 | minikube | disabled     |
| ingress                     | minikube | disabled     |
| ingress-dns                 | minikube | disabled     |
| istio                       | minikube | disabled     |
| istio-provisioner           | minikube | disabled     |
| kubevirt                    | minikube | disabled     |
| logviewer                   | minikube | disabled     |
| metallb                     | minikube | disabled     |
| metrics-server              | minikube | disabled     |
| nvidia-driver-installer     | minikube | disabled     |
| nvidia-gpu-device-plugin    | minikube | disabled     |
| olm                         | minikube | disabled     |
| pod-security-policy         | minikube | disabled     |
| registry                    | minikube | disabled     |
| registry-aliases            | minikube | disabled     |
| registry-creds              | minikube | disabled     |
| storage-provisioner         | minikube | enabled ✅   |
| storage-provisioner-gluster | minikube | disabled     |
| volumesnapshots             | minikube | disabled     |
|-----------------------------|----------|--------------|

#abilitando metrics-server

cyborg@wcyborg:~/Kubernets$ minikube addons enable metrics-server
🌟  The 'metrics-server' addon is enabled
cyborg@wcyborg:~/Kubernets$ minikube addons list
|-----------------------------|----------|--------------|
|         ADDON NAME          | PROFILE  |    STATUS    |
|-----------------------------|----------|--------------|
| ambassador                  | minikube | disabled     |
| csi-hostpath-driver         | minikube | disabled     |
| dashboard                   | minikube | disabled     |
| default-storageclass        | minikube | enabled ✅   |
| efk                         | minikube | disabled     |
| freshpod                    | minikube | disabled     |
| gcp-auth                    | minikube | disabled     |
| gvisor                      | minikube | disabled     |
| helm-tiller                 | minikube | disabled     |
| ingress                     | minikube | disabled     |
| ingress-dns                 | minikube | disabled     |
| istio                       | minikube | disabled     |
| istio-provisioner           | minikube | disabled     |
| kubevirt                    | minikube | disabled     |
| logviewer                   | minikube | disabled     |
| metallb                     | minikube | disabled     |
| metrics-server              | minikube | enabled ✅   |
| nvidia-driver-installer     | minikube | disabled     |
| nvidia-gpu-device-plugin    | minikube | disabled     |
| olm                         | minikube | disabled     |
| pod-security-policy         | minikube | disabled     |
| registry                    | minikube | disabled     |
| registry-aliases            | minikube | disabled     |
| registry-creds              | minikube | disabled     |
| storage-provisioner         | minikube | enabled ✅   |
| storage-provisioner-gluster | minikube | disabled     |
| volumesnapshots             | minikube | disabled     |
|-----------------------------|----------|--------------|

#escalando o wordpress-deployment

cyborg@wcyborg:~/Kubernets$ kubectl get deployment
NAME                   READY   UP-TO-DATE   AVAILABLE   AGE
mysql-deployment       1/1     1            1           28m
wordpress-deployment   1/1     1            1           28m

cyborg@wcyborg:~/Kubernets$ kubectl delete hpa wordpress-deployment
horizontalpodautoscaler.autoscaling "wordpress-deployment" deleted

cyborg@wcyborg:~/Kubernets$ kubectl autoscale deployment wordpress-deployment --cpu-percent=20 --min=1 --max=20
horizontalpodautoscaler.autoscaling/wordpress-deployment autoscaled

cyborg@wcyborg:~/Kubernets$ kubectl get hpa
NAME                   REFERENCE                         TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
wordpress-deployment   Deployment/wordpress-deployment   0%/20%    1         20        1          4m41s

cyborg@wcyborg:~/Kubernets$ kubectl top pods
NAME                                    CPU(cores)   MEMORY(bytes)   
mysql-deployment-7b4b74c88b-wpn9j       0m           456Mi           
wordpress-deployment-69cdf58954-znxlr   0m           21Mi

cyborg@wcyborg:~/Kubernets$ kubectl get svc
NAME                TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP        23h
mysql-service       ClusterIP      10.110.138.6    <none>        3306/TCP       44m
wordpress-service   LoadBalancer   10.108.238.39   <pending>     80:31339/TCP   44m

cyborg@wcyborg:~/Kubernets$ minikube service wordpress-service --url
http://192.168.49.2:31339

cyborg@wcyborg:~/Kubernets$ siege c20 t60s http://192.168.49.2:30251/wp-login.php
New configuration template added to /home/cyborg/.siege
Run siege -C to view the current settings in that file
** SIEGE 4.0.4
** Preparing 25 concurrent users for battle.
The server is now under siege...[error] socket: unable to connect sock.c:249: Connection refused
[error] socket: unable to connect sock.c:249: Connection refused
[error] socket: unable to connect sock.c:249: Connection refused
^C
Lifting the server siege...
Transactions:		       16824 hits
Availability:		       99.42 %
Elapsed time:		      238.41 secs
Data transferred:	      298.48 MB
Response time:		        0.35 secs
Transaction rate:	       70.57 trans/sec
Throughput:		        1.25 MB/sec
Concurrency:		       24.97
Successful transactions:       16824
Failed transactions:	          98
Longest transaction:	        5.20
Shortest transaction:	        0.00

cyborg@wcyborg:~/Kubernets$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
mysql-deployment-7b4b74c88b-rqcsv       1/1     Running   0          14m
wordpress-deployment-69cdf58954-22w9x   0/1     Pending   0          22s
wordpress-deployment-69cdf58954-5kml2   1/1     Running   0          2m48s
wordpress-deployment-69cdf58954-fkjsd   1/1     Running   0          2m48s
wordpress-deployment-69cdf58954-ghdsw   0/1     Pending   0          19s
wordpress-deployment-69cdf58954-lv9d7   0/1     Pending   0          19s
wordpress-deployment-69cdf58954-nx6hd   0/1     Pending   0          32s
wordpress-deployment-69cdf58954-ph422   1/1     Running   0          106s
wordpress-deployment-69cdf58954-tnd5d   0/1     Pending   0          22s
wordpress-deployment-69cdf58954-vn62q   1/1     Running   1          14m
wordpress-deployment-69cdf58954-xwxxj   1/1     Running   0          2m48s

cyborg@wcyborg:~/Kubernets$ kubectl get hpa
NAME                   REFERENCE                         TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
wordpress-deployment   Deployment/wordpress-deployment   77%/20%   1         20        16         9m10s
