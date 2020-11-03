#!/bin/bash

kubectl create -f redis/redis-configmap.yaml 
kubectl create -f redis/redis-storage.yaml 
kubectl create -f redis/redis-deployment.yaml 
kubectl create -f redis/redis-service.yaml 

sleep 2

kubectl create -f postgres/postgres-configmap.yaml 
kubectl create -f postgres/postgres-storage.yaml 
kubectl create -f postgres/postgres-deployment.yaml 
kubectl create -f postgres/postgres-service.yaml 

#kubectl get pods
#kubectl port-forward <your-primary-pod-name> 13000:5432 &
#psql -h localhost -p 13000 -U postgres postgres
#postgres=# \du

sleep 2

kubectl create -f java/java-configuration.yaml
kubectl create -f java/java-deployment.yaml
kubectl create -f java/java-services.yaml 
kubectl delete hpa java
kubectl autoscale deployment java --cpu-percent=20 --min=1 --max=20
minikube service java --url

sleep 2

kubectl create -f nginx/nginx-configuration.yaml
kubectl create -f nginx/nginx-deployment.yaml
kubectl create -f nginx/nginx-services.yaml 
minikube service nginx --url
